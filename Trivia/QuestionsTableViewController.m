//
//  QuestionsTableViewController.m
//  Trivia
//
//  Created by KAKA on 1/13/16.
//  Copyright © 2016 Simon Zhu. All rights reserved.
//

#import "QuestionsTableViewController.h"
#import "QuestionViewController.h"

@interface QuestionsTableViewController ()

@end

@implementation QuestionsTableViewController

@synthesize languagesInt;
NSMutableArray * array = nil;
NSArray * searchArray = nil;
NSString * file = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    cArray = [[NSMutableArray alloc] initWithObjects:
              @"C: What is a NULL Pointer?",
              @"C: What is a pointer on pointer?",
              @"C: What is the difference between malloc() & calloc()?",
              @"C: What is a dangling pointer?",
              @"C: Can a program be compiled without main() function?",
              @"C: What is a preprocessor?",
              @"C: What is a token?",
              @"C: How is a negative integer is stored?",
              @"C: What is a static variable?",
              nil];
    
    javaArray = [[NSMutableArray alloc] initWithObjects:
                 @"Java: What is Singleton class?",
                 @"Java: List the three steps for creating an Object for a class?",
                 @"Java: What is a static variable?",
                 @"Java: When parseInt() method can be used?",
                 @"Java: What is the difference between StringBuffer and StringBuilder class?",
                 @"Java: What is finalize() method?",
                 @"Java: What is an Exception?",
                 @"Java: Define Inheritance?",
                 @"Java: What is Polymorphism?",
                 @"Java: What is Encapsulation?",
                 @"Java: What is an Interface?",
                 @"Java: Why are Packages used?",
                 nil];
    
    rubyArray = [[NSMutableArray alloc] initWithObjects:
                 @"Ruby: How are these operators used: ==, ===, eql?, equal?",
                 @"Ruby: What is the use of :var in Ruby?",
                 @"Ruby: What is the difference between classes and modules?",
                 @"Ruby: What are the three levels of method access control for classes and modules?",
                 nil];
    
    pythonArray = [[NSMutableArray alloc] initWithObjects:@"Python Question 1", @"Python Question 2", @"Python Question 3", nil];
    
    javascriptArray = [[NSMutableArray alloc] initWithObjects:
        @"Javascript: What is prototype?",
        @"Javascript: What are closures and how are they used?",
        @"Javascript: What is the difference between == and === ?",
        @"Javascript: What datatypes are supported in Javascript?",
        @"Javascript: What is the difference between a null value and an undefined value?",
        @"Javascript: What is NaN?",
        @"Javascript: Explain the concept of unobtrusive Javascript?",
        @"Javascript: Describe an instance of prototypal inheritance in JavaScript?",
        @"Javascript: Explain the meaning of  the keyword ‘this’ in JavaScript functions",
        @"Javascript: What does a timer do and how would you implement one?",
        @"Javascript: Is there automatic type conversion in JavaScript?",
        @"Javascript: Which conditional statements will JavaScript support?",
        nil];
    
    if(languagesInt == 0){
        array = cArray;
        file = @"C.png";
    }
    else if(languagesInt == 1){
        array = javaArray;
        file = @"Java.png";
    }
    else if(languagesInt == 2){
        array = rubyArray;
        file = @"Ruby.png";
    }
    else if(languagesInt == 3){
        array = pythonArray;
        file = @"Python.png";
    }
    else if(languagesInt == 4){
        array = javascriptArray;
        file = @"Javascript.png";
    }
    else
        array = nil;
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
    
    if(tableView == self.searchDisplayController.searchResultsTableView){
        return [searchArray count];
    }
    
    // returns the number of rows depending on the language selected
    return [array count];
}

// You must implement this method (Since it is a delegate method to render a cell)

// Method that tells you how to render the cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * cellName = @"Cell";
    UITableViewCell *cell;
    
    //    cell = [tableView dequeueReusableCellWithIdentifier:cellName forIndexPath:indexPath]
    
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
    }
    
    if(tableView == self.searchDisplayController.searchResultsTableView){
        cell.imageView.image = [UIImage imageNamed: file];
        cell.textLabel.text = [searchArray objectAtIndex:indexPath.row];
        cell.textLabel.font = [UIFont systemFontOfSize:14];
    }
    else{
        cell.imageView.image = [UIImage imageNamed: file];
        cell.textLabel.text = [array objectAtIndex:indexPath.row];
        cell.textLabel.font = [UIFont systemFontOfSize:14];
    }
    
    // trick like in Storyboard, when you set the numberOfLines to 0, it will scale to how many lines it needs to display the text
    cell.textLabel.numberOfLines = 0;
    
    
    // Configure the cell...
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    QuestionViewController * question = [self.storyboard instantiateViewControllerWithIdentifier:@"QuestionViewController"];

    NSLog(@"Hello1");
    
    NSString * str = [array objectAtIndex: indexPath.row];
    
    question.currentQuestion = str;
    
    // Animations:
    // present shows bottom to top
    // push shows right to left
    // push pushes the viewcontroller onto the stack (Navigation Controller)
    
    // only navigation controller can push
    
    [self.navigationController pushViewController:question animated:true];
    
//    if ([[languagesArray objectAtIndex:indexPath.row] isEqual:@"C"]) {
//        languages.languagesInt = 0;
//        [languages setTitle:[languagesArray objectAtIndex:indexPath.row]];
//    }
//    
//    if ([[languagesArray objectAtIndex:indexPath.row] isEqual:@"Java"]) {
//        languages.languagesInt = 1;
//        [languages setTitle:[languagesArray objectAtIndex:indexPath.row]];
//    }
//    
//    if ([[languagesArray objectAtIndex:indexPath.row] isEqual:@"Ruby"]) {
//        languages.languagesInt = 2;
//        [languages setTitle:[languagesArray objectAtIndex:indexPath.row]];
//    }
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
- (void)filterContentForSearchText:(NSString *)searchText scope:(NSString *)scope
{
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"description contains[c] %@", searchText];
    searchArray = [array filteredArrayUsingPredicate:resultPredicate];
}
//===========================================================================//

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
