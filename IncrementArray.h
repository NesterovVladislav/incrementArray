//
//  IncrementArray.h
//  incrementArray
//
//  Created by Nesterov on 02/03/17.
//  Copyright © 2017 Nesterov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IncrementArray : NSObject
@property(nonatomic,readwrite,strong) void (^enumirationComleteHandler)();

-(instancetype)initWithBlock:(NSArray<NSString *> *(^)())dataProvider;
-(void)populate;
-(void)enumerateItems:(void(^)( NSString * obj, NSInteger item))enumerate;
-(void)asyncItemAtIndex:(NSInteger) index bloc:( void (^) ( NSString * str))showElement;

- ( instancetype )init NS_UNAVAILABLE;

@end
