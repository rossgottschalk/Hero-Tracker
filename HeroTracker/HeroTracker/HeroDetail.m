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
        NSDictionary *dataDict = heroListDict[@"data"];
        NSArray *results = dataDict [@"results"];
        for (NSDictionary *result in results)
        {
            NSString *name = result[@"name"];
            aHero.name = name;
            
            NSString *aDescription = result[@"description"];
            aHero.aDescription = aDescription;
            
            NSDictionary *imageDict = result[@"thumbnail"];
            NSString *image = imageDict[@"path"];
            aHero.heroImage = [NSString stringWithFormat:@"%@.jpg", image];
            //        aHero.homeworld = heroListDict [@"homeworld"];
            //        aHero.powers = [heroListDict objectForKey:@"powers"];
        }
    }
    return aHero;
}


@end
