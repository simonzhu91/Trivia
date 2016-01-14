//
//  QuestionViewController.m
//  Trivia
//
//  Created by KAKA on 1/14/16.
//  Copyright © 2016 Simon Zhu. All rights reserved.
//

#import "QuestionViewController.h"

@interface QuestionViewController ()

@end

@implementation QuestionViewController

@synthesize currentQuestion;
NSMutableDictionary * dict;

// NSUserDefaults (Saves to the phone)?
// Store anything (Strings, Dictionary)

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSArray * questions = [[NSArray alloc] initWithObjects:
                           @"C: What is a NULL Pointer?",
                           @"C: What is a pointer on pointer?",
                           @"C: What is the difference between malloc() & calloc()?",
                           @"C: What is a dangling pointer?",
                           @"C: Can a program be compiled without main() function?",
                           @"C: What is a preprocessor?",
                           @"C: What is a token?",
                           @"C: How is a negative integer is stored?",
                           @"C: What is a static variable?",
                           
                           @"Java Question 1",
                           @"Java Question 2",
                           @"Java Question 3",
                           @"Ruby Question 1",
                           @"Ruby Question 2",
                           @"Ruby Question 3",
                           nil];
    
    NSArray * answers = [[NSArray alloc] initWithObjects:
                         @"A pointer pointing to nothing is called so. Eg: char *p=NULL;",
                         @"It’s a pointer variable which can hold the address of another pointer variable. It de-refers twice to point to the data held by the designated pointer variable. Eg: int x = 5, *p=&x, **q=&p; Therefore ‘x’ can be accessed by **q.",
                         @"Both allocates memory from heap area/dynamic memory. By default calloc fills the allocated memory with 0’s.",
                         @"A pointer initially holding valid address, but later the held address is released or freed. Then such a pointer is called as dangling pointer.",
                         @"Yes, it can be but cannot be executed, as the execution requires main() function definition.",
                         @"Preprocessor is a directive to the compiler to perform certain things before the actual compilation process begins.",
                         @"A C program consists of various tokens and a token is either a keyword, an identifier, a constant, a string literal, or a symbol.",
                         @"Get the two’s compliment of the same positive integer. Eg: 1101 (-5)\n\nStep-1 − One’s compliment of 5 : 1010\n\nStep-2 − Add 1 to above, giving 1011, which is -5",
                         
                         @"A static local variables retains its value between the function call and the default value is 0. The following function will print 1 2 3 if called thrice.\n\nvoid f() {\nstatic int i;\n++i;\nprintf(“%d “,i);\n}\n\nIf a global variable is static then its visibility is limited to the same source code.",
                         @"J1",
                         @"J2",
                         @"J3",
                         @"R1",
                         @"R2",
                         @"R3",
                         nil];
    
    dict = [[NSMutableDictionary alloc] initWithObjects:answers forKeys:questions];
    
    // Do any additional setup after loading the view.
    // sets the label to the current question
    [self.lbl_question setText: currentQuestion];
    
    NSString * ans = [dict valueForKey: currentQuestion];
    
    if(ans != nil)
        [self.lbl_answer setText: ans];
    else
        [self.lbl_answer setText: @"N/A"];
    
    [self.lbl_answer setHidden: TRUE];
    
}

// to show the answer
- (IBAction) toggleAnswer:(id)sender {
    
    if(self.lbl_answer.hidden == false){
        [self.lbl_answer setHidden: true];

        [self.toggleButton setTitle:@"Show Answer" forState:UIControlStateNormal];
    }
    else {
        [self.lbl_answer setHidden: false];
        [self.toggleButton setTitle:@"Hide Answer" forState:UIControlStateNormal];

    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
