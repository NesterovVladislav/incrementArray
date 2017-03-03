//
//  ModelArray.h
//  incrementArray
//
//  Created by Nesterov on 02/03/17.
//  Copyright © 2017 Nesterov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelArray : NSObject

- (instancetype)init;

-(void)saveEnumerationCompleteHandler : (void (^) ( ))completeHandler;
-(void)create;
-(void)enumeration;
-(void)itemAtIndex:(NSInteger) index bloc:( void (^) ( NSString * str))showElement;

-(int)returnCount;

@end
