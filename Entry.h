//
//  Entry.h
//  DayX2
//
//  Created by jonathan thornburg on 5/31/15.
//  Copyright (c) 2015 jonathan thornburg. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const titleKey = @"titleKey";
static NSString * const bodyTextKey = @"bodyTextKey";
static NSString * const timestampKey = @"timestampKey";

@interface Entry : NSObject

@property (strong) NSString *title;
@property (strong) NSString *bodyText;
@property (strong) NSDate *timestamp;

- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;



@end
