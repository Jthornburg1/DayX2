//
//  EntryController.m
//  DayX2
//
//  Created by jonathan thornburg on 5/31/15.
//  Copyright (c) 2015 jonathan thornburg. All rights reserved.
//

#import "EntryController.h"
#import "Entry.h"

@interface EntryController ()

@property (nonatomic, strong) NSArray *entries;

@end

@implementation EntryController
+ (EntryController *)sharedInstance {
    static EntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [EntryController new];
        
        [sharedInstance loadFromPersistentStorage];
    });
    return sharedInstance;
}
- (void)addEntry:(Entry *)entry
{
    if (!entry) {
        return;
    }
    NSMutableArray *entriesArray = self.entries.mutableCopy;
    [entriesArray addObject:entry];
    self.entries = entriesArray;
    [self saveToPersistentStorage];
}
-(void)removeEntry:(Entry *)entry{
    NSMutableArray *entriesArray = self.entries.mutableCopy;
    [entriesArray addObject:entry];
    self.entries = entriesArray;
    [self saveToPersistentStorage];
}
- (Entry *)createEntryWithTitle:(NSString *)title bodyText:(NSString *)bodyText
{
    Entry *entry = [Entry new];
    
    entry.title = title;
    entry.bodyText = bodyText;
    entry.timestamp = [NSDate date];
    
    [self addEntry:entry];
    
    return entry;
}
- (void)saveToPersistentStorage
{
    NSMutableArray *entriesArray = [NSMutableArray new];
    for (Entry *entry in self.entries) {
        [entriesArray addObject:[entry dictionaryRepresentation]];
    }
    [[NSUserDefaults standardUserDefaults] setObject:entriesArray forKey:allEntriesKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
- (void)loadFromPersistentStorage
{
    NSArray *entriesArray = [[NSUserDefaults standardUserDefaults] objectForKey:allEntriesKey];
    self.entries = entriesArray;
    
    NSMutableArray *entries = [NSMutableArray new];
    for (NSDictionary *entry in entriesArray) {
        [entries addObject:[[Entry alloc] initWithDictionary:entry]];
    }
    self.entries = entries;
}


@end
