//
//  HeroTableViewController.h
//  HeroTracker
//
//  Created by Ross Gottschalk on 7/25/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SearchTextFieldDelegate
-(void)searchWasTapped: (NSString *)heroToSearch;
@end


@protocol APIControllerProtocol
-(void)didReceiveAPIResults: (NSDictionary *)marvelResponse;
@end


@interface HeroTableViewController : UITableViewController
@end
