//
//  Hero.m
//  HeroTracker
//
//  Created by Ross Gottschalk on 7/25/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import "HeroDetail.h"

@implementation HeroDetail

+ (HeroDetail *)heroListWithDictionary:(NSDictionary *) heroListDict;
{
    HeroDetail *aHero = nil;
    if (heroListDict)
    {
        aHero = [[HeroDetail alloc] init];
        aHero.name = [heroListDict objectForKey:@"name"];
        aHero.homeworld = heroListDict [@"homeworld"];
        aHero.powers = [heroListDict objectForKey:@"powers"];
        
    }
    
    return aHero;
}


@end
