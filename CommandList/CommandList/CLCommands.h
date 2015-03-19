//
//  CLCommands.h
//  CommandList
//
//  Created by Sergio Perez on 3/18/15.
//  Copyright (c) 2015 Learning iOS Development. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CLCommands : NSObject

+ (NSInteger)count;
+ (NSDictionary *)commandsAtIndex:(NSInteger)index;
+ (NSString *)titleAtIndex:(NSInteger)index;
+ (NSString *)descriptionAtIndex:(NSInteger)index;
+ (NSInteger)commandCountStepsAtIndex:(NSInteger)index;
+ (NSString *)commandTypeAtIndex:(NSInteger)comTypeIndex comAtIndex:(NSInteger)comIndex;
+ (NSString *)commandScopeAtIndex:(NSInteger)comTypeIndex comAtIndex:(NSInteger)comIndex;
+ (NSArray *)howToAtIndex:(NSInteger)index;

@end
