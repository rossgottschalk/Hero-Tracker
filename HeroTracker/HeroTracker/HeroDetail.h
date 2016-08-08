//
//  Hero.h
//  HeroTracker
//
//  Created by Ross Gottschalk on 7/25/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HeroDetail : NSObject



@property (nonatomic) NSString *name;
//@property (nonatomic) NSString *homeworld;
//@property (nonatomic) NSString *powers;

+ (HeroDetail *)heroListWithDictionary:(NSDictionary *) heroListDict;


@end
