//
//  SearchViewController.m
//  HeroTracker
//
//  Created by Ross Gottschalk on 8/8/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@end

@implementation SearchViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.searchTextField becomeFirstResponder];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



#pragma - Action Handlers
- (IBAction)searchTapped:(UIButton *)sender
{
    [self.delegate searchWasTapped:self.searchTextField.text];
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)cancelTapped:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
