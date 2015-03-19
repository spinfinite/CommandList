//
//  CLCommands.m
//  CommandList
//
//  Created by Sergio Perez on 3/18/15.
//  Copyright (c) 2015 Learning iOS Development. All rights reserved.
//

#import "CLCommands.h"

static NSString * const CommandsTitleKey = @"commandsTitle";
static NSString * const CommandsDescriptionKey = @"commandsDescription";
static NSString * const CommandsStepsKey = @"commandsSteps";
static NSString * const CommandsScopeKey = @"commandsScope";
static NSString * const CommandsTypeKey = @"commandsType";
static NSString * const CommandsAdditionalInfoKey = @"commandsAddInfo";

@implementation CLCommands

+ (NSInteger)count{
    return [[self commands] count];
}

+ (NSDictionary *)commandsAtIndex:(NSInteger)index{
    return[self commands][index];
}

+ (NSString *)titleAtIndex:(NSInteger)index{
    return[self commands][index][CommandsTitleKey];
}

+ (NSString *)descriptionAtIndex:(NSInteger)index{
    return[self commands][index][CommandsDescriptionKey];
}

+ (NSInteger)commandCountStepsAtIndex:(NSInteger)index{
    return[[self commands][index][CommandsStepsKey] count];
}

+ (NSString *)commandTypeAtIndex:(NSInteger)comTypeIndex comAtIndex:(NSInteger)comIndex{
    return[self commands][comIndex][CommandsStepsKey][comTypeIndex][CommandsTypeKey];
}

+ (NSString *)commandScopeAtIndex:(NSInteger)comTypeIndex comAtIndex:(NSInteger)comIndex{
    return[self commands][comIndex][CommandsStepsKey][comTypeIndex][CommandsScopeKey];
    
}

+ (NSArray *)howToAtIndex:(NSInteger)index{
    return[self commands][index][CommandsAdditionalInfoKey];
}

+ (NSArray *)commands{
    
    return @[
             @{
                 CommandsTitleKey : @"365 Update MCM Firmware",
                 CommandsDescriptionKey : @"Use this command to update the firmware of an 820 Device",
                 CommandsStepsKey : @[
                         @{CommandsTypeKey: @"enter 54912, Programming Mode", CommandsScopeKey: @"Await for tone"},
                         @{CommandsTypeKey: @"enter 333", CommandsScopeKey: @"Await for 3 Positive Tones"},
                         @{CommandsTypeKey: @"enter 365", CommandsScopeKey: @"Await for Panic"},
                         @{CommandsTypeKey: @"press Enter to stop Panic", CommandsScopeKey: @"Check About Screen"}
                         ],
                 CommandsAdditionalInfoKey :@[@"Ensure the thumbdrive is formatted to FAT",
                                              @"Ensure your thumbdrive is updated to the latest firmware posted at the SVN site.",
                                              @"The firmware update could take longer depending on the starting firmware version."]
                 },
             @{
                 CommandsTitleKey : @"555 Update Handheld/Touchscreen Firmware",
                 CommandsDescriptionKey : @"Use this command to update the handheld (USB Port) touchscreen (touchscreen USB port)",
                 CommandsStepsKey : @[
                         @{CommandsTypeKey: @"enter 54912, Programming Mode", CommandsScopeKey: @"Await for tone"},
                         @{CommandsTypeKey: @"enter 333", CommandsScopeKey: @"Await for 3 Positive Tones"},
                         @{CommandsTypeKey: @"enter 555", CommandsScopeKey: @"Await for Panic"},
                         @{CommandsTypeKey: @"press Enter to stop Panic", CommandsScopeKey: @"Check About Screen"}
                         ],
                 CommandsAdditionalInfoKey :@[@"Ensure the thumbdrive is formatted to FAT",
                                              @"Ensure your thumbdrive is updated to the latest firmware posted at the SVN site.",
                                              @"The firmware update could take longer depending on the starting firmware version."]
                 
                 
                 }
             
             ];
    
    
}

@end
