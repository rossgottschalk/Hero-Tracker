//
//  APIController.h
//  HeroTracker
//
//  Created by Ben Gohlke on 8/8/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HeroTableViewController.h"

@interface APIController : NSObject

@property (strong, nonatomic) id<APIControllerProtocol> delegate;


+ (APIController *)sharedAPIController;
- (void)searchForCharacter:(NSString *)characterName;

@end
