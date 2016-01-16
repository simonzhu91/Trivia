//
//  LanguagesTableViewController.m
//  Trivia
//
//  Created by KAKA on 1/13/16.
//  Copyright © 2016 Simon Zhu. All rights reserved.
//

#import "LanguagesTableViewController.h"
#import "QuestionsTableViewController.h"

@interface LanguagesTableViewController ()

@end

@implementation LanguagesTableViewController


// Embed this in navigation controller which is automatically called when the app launches
// editor > embed in > navigation view controller

// Use Find + Replace for remaining files (Modules) in Xcode

// Get rid of useless files

NSMutableArray <NSString *> * languagesArray;

// for searchResults
NSArray <NSString *> *searchResults;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // creating a languagesArray with Strings
    languagesArray = [[NSMutableArray alloc] init];
    [languagesArray addObject: @"C"];
    [languagesArray addObject: @"Java"];
    [languagesArray addObject: @"Ruby"];
    [languagesArray addObject: @"Python"];
    [languagesArray addObject: @"Javascript"];
    
    [self setTitle: @"Programming Languages"];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [searchResults count];
    }
    
    return [languagesArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * cellName = @"Cell";
    
    UITableViewCell *cell;
    NSString * file;
    
//    cell = [tableView dequeueReusableCellWithIdentifier:cellName forIndexPath:indexPath]
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
    }
    

    if (tableView == self.searchDisplayController.searchResultsTableView) {
        file = [[searchResults objectAtIndex: indexPath.row] stringByAppendingString:@".png"];
        cell.imageView.image = [UIImage imageNamed: file];
        cell.textLabel.text = [searchResults objectAtIndex:indexPath.row];
    }
    else{
        file = [[languagesArray objectAtIndex: indexPath.row] stringByAppendingString:@".png"];
        cell.imageView.image = [UIImage imageNamed: file];
        cell.textLabel.text = [languagesArray objectAtIndex:indexPath.row];
    }
    
    return cell;
}

// For SEARCH
//===========================================================================//
// Method that is called everytime user types a character into the search bar
-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
    objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    
    return YES;
}

// filters the results on the page based on search query
- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"description contains[c] %@", searchText];
    searchResults = [languagesArray filteredArrayUsingPredicate:resultPredicate];
}
//===========================================================================//

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 71;
//}

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

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


// Overriding to support custom behavior when a row is selected
// 1. Creates Instance of the target ViewController
// 2. Calls pushViewController passing in the new Controller

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    QuestionsTableViewController *languages = [self.storyboard instantiateViewControllerWithIdentifier:@"QuestionsTableViewController"];
    
//    QuestionsTableViewController * languages = [self.storyboard ]
    
    NSLog(@"Hello");
    
    if ([[languagesArray objectAtIndex:indexPath.row] isEqual:@"C"]) {
        languages.languagesInt = 0;
        [languages setTitle:[languagesArray objectAtIndex:indexPath.row]];
    }
    
    if ([[languagesArray objectAtIndex:indexPath.row] isEqual:@"Java"]) {
        languages.languagesInt = 1;
        [languages setTitle:[languagesArray objectAtIndex:indexPath.row]];
    }
    
    if ([[languagesArray objectAtIndex:indexPath.row] isEqual:@"Ruby"]) {
        languages.languagesInt = 2;
        [languages setTitle:[languagesArray objectAtIndex:indexPath.row]];
    }
    
    if ([[languagesArray objectAtIndex:indexPath.row] isEqual:@"Python"]) {
        languages.languagesInt = 3;
        [languages setTitle:[languagesArray objectAtIndex:indexPath.row]];
    }
    
    if ([[languagesArray objectAtIndex:indexPath.row] isEqual:@"Javascript"]) {
        languages.languagesInt = 4;
        [languages setTitle:[languagesArray objectAtIndex:indexPath.row]];
    }
    
//    [self.navigationController pushViewController:newView animated:YES];
//    
    // renders the appropriate ViewController
//    [self presentViewController:languages animated:<#(BOOL)#> completion:<#^(void)completion#>]
    
    // presentViewController does not require navigationController
    // pushViewController / popViewController, you need to use navigationController to do this
    // NavigationController is a main Controller to control the Application
    
    [self.navigationController pushViewController:languages animated:YES];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
