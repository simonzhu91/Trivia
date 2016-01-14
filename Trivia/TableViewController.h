//
//  TableViewController.h
//  Trivia
//
//  Created by KAKA on 1/13/16.
//  Copyright © 2016 Simon Zhu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController {

    NSMutableArray * C_Language;
    NSMutableArray * Java_Language;
    NSMutableArray * Python_Language;
    NSMutableArray * Ruby_Language;
    int languages_int;
}


// Tells us which language we are currently trying to load
// 1. C
// 2. Java
// 3. Python
// 4. Ruby
@property int languages_int;


@end
