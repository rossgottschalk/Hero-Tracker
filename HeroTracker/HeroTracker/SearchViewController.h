//
//  SearchViewController.h
//  HeroTracker
//
//  Created by Ross Gottschalk on 8/8/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeroTableViewController.h"

@interface SearchViewController : UIViewController

@property (nonatomic) id<SearchTextFieldDelegate> delegate;

@end
