//
//  DetailViewController.h
//  DayX2
//
//  Created by jonathan thornburg on 5/31/15.
//  Copyright (c) 2015 jonathan thornburg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Entry.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) Entry *entry;

- (void)updateWithEntry:(Entry *)entry;


@end
