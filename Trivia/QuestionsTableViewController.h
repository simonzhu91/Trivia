//
//  QuestionsTableViewController.h
//  Trivia
//
//  Created by KAKA on 1/13/16.
//  Copyright © 2016 Simon Zhu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionsTableViewController : UITableViewController{
    NSMutableArray *cArray;
    NSMutableArray *javaArray;
    NSMutableArray *rubyArray;
    NSMutableArray *pythonArray;
    NSMutableArray *javascriptArray;
    
    int languagesInt;
}


// Tells us which language we are currently trying to load
// 1. C
// 2. Java
// 3. Python
// 4. Ruby
@property int languagesInt;


@end
