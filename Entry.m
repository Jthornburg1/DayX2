//
//  Entry.m
//  DayX2
//
//  Created by jonathan thornburg on 5/31/15.
//  Copyright (c) 2015 jonathan thornburg. All rights reserved.
//

#import "Entry.h"

@implementation Entry

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        self.title = dict[titleKey];
        self.bodyText = dict[bodyTextKey];
        self.timestamp = dict[timestampKey];
    }
    return self;
}
- (NSDictionary *)dictionaryRepresentation
{
    NSDictionary *dict = @{
                           titleKey : self.title,
                           bodyTextKey : self.bodyText,
                           timestampKey : self.timestamp};
    return dict;
}

@end
