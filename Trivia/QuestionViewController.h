//
//  QuestionViewController.h
//  Trivia
//
//  Created by KAKA on 1/14/16.
//  Copyright © 2016 Simon Zhu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionViewController : UIViewController
{
   
}

@property NSString * currentQuestion;


@property (weak, nonatomic) IBOutlet UILabel *lbl_question;
@property (weak, nonatomic) IBOutlet UILabel *lbl_answer;
@property (weak, nonatomic) IBOutlet UIButton *toggleButton;

@end
