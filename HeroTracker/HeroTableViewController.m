//
//  HeroTableViewController.m
//  HeroTracker
//
//  Created by Ross Gottschalk on 7/25/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import "HeroTableViewController.h"
#import "HeroDetailViewController.h"
#import "SearchViewController.h"
#import "HeroDetail.h"
#import "APIController.h"

@interface HeroTableViewController () <SearchTextFieldDelegate, APIControllerProtocol>
@property (strong, nonatomic) NSMutableArray *heroes;
@end

////[[APIController sharedAPIController]searchForCharacter: @"Hulk"]

@implementation HeroTableViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Hero Tracker";
    self.heroes = [[NSMutableArray alloc] init];
    //[self loadHeroes];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}



//-(void)loadHeroes
//{
//    NSString *filepath = [[NSBundle mainBundle] pathForResource:@"heroes" ofType:@"json"];
//    NSArray *heroesJSON = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filepath] options:0 error:nil];
//    for(NSDictionary *aDict in heroesJSON)
//    {
//        HeroDetail *aHero = [HeroDetail heroListWithDictionary:aDict];
//        [self.heroes addObject: aHero];
//    }
//}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.heroes.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HeroListCell" forIndexPath:indexPath];
    HeroDetail *hero = self.heroes[indexPath.row];
    cell.textLabel.text = hero.name;
    return cell;
}


#pragma - Delegates
-(void)searchWasTapped:(NSString *)heroToSearch
{
    APIController *apiController = [APIController sharedAPIController];
    apiController.delegate = self;
    [apiController searchForCharacter:heroToSearch];
    [self.tableView reloadData];
}
-(void)didReceiveAPIResults:(NSDictionary *)marvelResponse
{
    HeroDetail *aHero = [HeroDetail heroListWithDictionary:marvelResponse];
    [self.heroes addObject:aHero];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
 
 
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"SearchHeroesSegue"])
    {
        SearchViewController *searchVC = [segue destinationViewController];
        searchVC.delegate = self;
//        HeroDetailViewController *heroDetailVC = [segue destinationViewController];
//        UITableViewCell *selectedCell = (UITableViewCell *) sender;
//        NSIndexPath *indexPath = [self.tableView indexPathForCell:selectedCell];
//        HeroDetail *selectedHero = self.heroes [indexPath.row];
//        heroDetailVC.hero = selectedHero;
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    HeroDetailViewController *heroDetailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailVC"];
    [[self navigationController] pushViewController:heroDetailVC animated:YES];
    HeroDetail *selectedHero = self.heroes[indexPath.row];
    heroDetailVC.hero = selectedHero;
}

@end
