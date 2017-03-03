//
//  ModelArray.m
//  incrementArray
//
//  Created by Nesterov on 02/03/17.
//  Copyright © 2017 Nesterov. All rights reserved.
//

#import "ModelArray.h"
#import "IncrementArray.h"

@implementation ModelArray
{
    IncrementArray * arrayString;
    __block int count;
}

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        typeof(self) __weak weakSelf = self;

        arrayString = [[IncrementArray alloc] initWithBlock:^NSArray<NSString *> *{
            return [weakSelf createArray];
        }];
    }
    
    return self;
}

-(void)itemAtIndex:(NSInteger) index bloc:( void (^) ( NSString * str))showElement
{
    [arrayString asyncItemAtIndex:index bloc:showElement];
}

-(void)saveEnumerationCompleteHandler : (void (^) ( ))completeHandler
{
    arrayString.enumirationComleteHandler = completeHandler;
}

-(int)returnCount
{
    return count;
}

-(void)enumeration
{
    count = 0;
    [arrayString enumerateItems:^(NSString *obj, NSInteger item) {
        ++count;
    }];
    arrayString.enumirationComleteHandler();
}

-(void)create
{
    [arrayString populate];
}

-(NSArray<NSString *> *)createArray
{
    NSArray<NSString *> * array = [[NSArray alloc] initWithObjects:@"Str1", @"Str2", @"Str3", @"Str4", @"Str5", nil];
    
    return array;
}

@end
