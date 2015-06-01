//
//  EntryController.h
//  DayX2
//
//  Created by jonathan thornburg on 5/31/15.
//  Copyright (c) 2015 jonathan thornburg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entry.h"

static NSString * const allEntriesKey = @"allEntriesKey";

@interface EntryController : NSObject

@property (nonatomic, strong, readonly) NSArray *entries;

+ (instancetype)sharedInstance;
- (Entry *)createEntryWithTitle:(NSString *)title bodyText:(NSString *)bodyText;
- (void)addEntry:(Entry *)entry;
-(void)removeEntry:(Entry *)entry;
- (void)saveToPersistentStorage;
- (void)loadFromPersistentStorage;


@end
