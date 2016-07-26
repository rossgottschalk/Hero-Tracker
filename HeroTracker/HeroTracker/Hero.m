//
//  Hero.m
//  HeroTracker
//
//  Created by Ross Gottschalk on 7/25/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import "Hero.h"

@implementation HeroList

+ (HeroList *)heroListWithDictionary:(NSDictionary *) heroListDict;
{
    HeroList *aHero = nil;
    if (heroListDict)
    {
        aHero = [[HeroList alloc] init];
        aHero.name = [heroListDict objectForKey:@"name"];
        aHero.planet = heroListDict [@"planet"];
        aHero.powers = [heroListDict objectForKey:@"powers"];
        
    }
    
    return aHero;
}


@end
