//
//  Hero.h
//  HeroTracker
//
//  Created by Ross Gottschalk on 7/25/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HeroList : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *planet;
@property (nonatomic) NSString *powers;

+ (HeroList *)heroListWithDictionary:(NSDictionary *) heroListDict;


@end
