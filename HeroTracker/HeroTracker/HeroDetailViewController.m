//
//  HeroDetailViewController.m
//  HeroTracker
//
//  Created by Ross Gottschalk on 7/25/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import "HeroDetailViewController.h"

@interface HeroDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
-(void) configureView;
@property (weak, nonatomic) IBOutlet UIImageView *heroImageView;
@property (weak, nonatomic) IBOutlet UILabel *heroDescriptionLabel;


@end

@implementation HeroDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureView];
    
    
//    self.title = @"Hero Bio";
//    self.heroNameLabel.text = self.hero.name;
//    self.homeworldLabel.text = self.hero.homeworld;
//    self.powerLabel.text = self.hero.powers;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)setHero:(HeroDetail *)newHero
{
    if (_hero != newHero)
    {
        _hero = newHero;
        
        // Update the view.
        [self configureView];
    }
}


- (void)configureView
{
    
    if (self.hero)
    {
        NSData *image = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString:self.hero.heroImage]];
        self.heroImageView.image = [UIImage imageWithData: image];
        self.nameLabel.text = self.hero.name;
        self.heroDescriptionLabel.text = self.hero.aDescription;
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
