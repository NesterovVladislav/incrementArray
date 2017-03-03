//
//  IncrementArray.m
//  incrementArray
//
//  Created by Nesterov on 02/03/17.
//  Copyright © 2017 Nesterov. All rights reserved.
//

#import "IncrementArray.h"

@implementation IncrementArray
{
    NSArray<NSString *> *(^saveArray)();
    void (^showString)(NSString *);
    NSArray<NSString *> * arrayString;
    NSString * returnString;
}

-(instancetype)initWithBlock:(NSArray<NSString *> *(^)())dataProvider
{
    self = [super init];
    if(self)
    {
        saveArray = dataProvider;
 
    }
    
    return self;
}

-(void)populate
{
    arrayString = saveArray();
}

-(void)enumerateItems:(void (^)(NSString *, NSInteger))enumerate
{
    NSInteger len = [arrayString count];
    for(int i = 0; i < len ; ++i)
    {
        enumerate(arrayString[i],i);
    }
}

-(void)showToTimer: (NSTimer *)timer
{
    showString(returnString);
    [timer invalidate];
}

-(void)asyncItemAtIndex:(NSInteger) index bloc:( void (^) ( NSString * str))showElement
{
    typeof(self) __weak weakSelf = self;
  
    [self enumerateItems:^(NSString *obj, NSInteger item) {
        [ weakSelf saveReturnStringAtIndex:item string:obj];
    }];
    
    showString = showElement;
    
    int timeInterval = arc4random() % 4 + 1;
    [NSTimer scheduledTimerWithTimeInterval:timeInterval
                                             target:self
                                   selector:@selector(showToTimer:)
                                   userInfo:NULL
                                    repeats:NO];
    
}



-(void)saveReturnStringAtIndex:(NSInteger) index string:(NSString *) str
{
    if(index == 2)
    {
        returnString = [[NSString alloc] initWithString:str];
    }
}


- ( instancetype )init
{
    assert( NO );
    return nil;
}

@end
