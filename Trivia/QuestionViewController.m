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
                           
                           @"Ruby: How are these operators used: ==, ===, eql?, equal?",
                           @"Ruby: What is the use of :var in Ruby?",
                           @"Ruby: What is the difference between classes and modules?",
                           @"Ruby: What are the three levels of method access control for classes and modules?",
                       
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
    
    NSArray * answers = [[NSArray alloc] initWithObjects:
                         
                         // C Answers
                         @"A pointer pointing to nothing is called so. Eg: char *p=NULL;",
                         @"It’s a pointer variable which can hold the address of another pointer variable. It de-refers twice to point to the data held by the designated pointer variable. Eg: int x = 5, *p=&x, **q=&p; Therefore ‘x’ can be accessed by **q.",
                         @"Both allocates memory from heap area/dynamic memory. By default calloc fills the allocated memory with 0’s.",
                         @"A pointer initially holding valid address, but later the held address is released or freed. Then such a pointer is called as dangling pointer.",
                         @"Yes, it can be but cannot be executed, as the execution requires main() function definition.",
                         @"Preprocessor is a directive to the compiler to perform certain things before the actual compilation process begins.",
                         @"A C program consists of various tokens and a token is either a keyword, an identifier, a constant, a string literal, or a symbol.",
                         @"Get the two’s compliment of the same positive integer. Eg: 1101 (-5)\n\nStep-1 − One’s compliment of 5 : 1010\n\nStep-2 − Add 1 to above, giving 1011, which is -5",
                         @"A static local variables retains its value between the function call and the default value is 0. The following function will print 1 2 3 if called thrice.\n\nvoid f() {\nstatic int i;\n++i;\nprintf(“%d “,i);\n}\n\nIf a global variable is static then its visibility is limited to the same source code.",
                         
                         // Java Answers
                         @"Singleton class control object creation, limiting the number to one but allowing the flexibility to create more objects if the situation changes.",
                         @"An Object is first declared, then instantiated and then it is initialized.",
                         @"Class variables also known as static variables are declared with the static keyword in a class, but outside a method, constructor or a block.",
                         @"This method is used to get the primitive data type of a certain String.",
                         @"Use StringBuilder whenever possible because it is faster than StringBuffer. But, if thread safety is necessary then use StringBuffer objects.",
                         @"It is possible to define a method that will be called just before an object's final destruction by the garbage collector. This method is called finalize( ), and it can be used to ensure that an object terminates cleanly.",
                         @"An exception is a problem that arises during the execution of a program. Exceptions are caught by handlers positioned along the thread's method invocation stack.",
                         @"It is the process where one object acquires the properties of another. With the use of inheritance the information is made manageable in a hierarchical order.",
                         @"Polymorphism is the ability of an object to take on many forms. The most common use of polymorphism in OOP occurs when a parent class reference is used to refer to a child class object.",
                         @"It is the technique of making the fields in a class private and providing access to the fields via public methods. If a field is declared private, it cannot be accessed by anyone outside the class, thereby hiding the fields within the class. Therefore encapsulation is also referred to as data hiding.",
                         @"An interface is a collection of abstract methods. A class implements an interface, thereby inheriting the abstract methods of the interface.",
                         @"Packages are used in Java in-order to prevent naming conflicts, to control access, to make searching/locating and usage of classes, interfaces, enumerations and annotations, etc., easier.",
                         
                         // Ruby Answers
                         @"== – Checks if the value of two operands are equal (often overridden to provide a class-specific definition of equality).\n\n=== – Specifically used to test equality within the when clause of a case statement (also often overridden to provide meaningful class-specific semantics in case statements).\n\neql? – Checks if the value and type of two operands are the same (as opposed to the == operator which compares values but ignores types). For example, 1 == 1.0 evaluates to true, whereas 1.eql?(1.0) evaluates to false.\n\nequal? – Compares the identity of two objects; i.e., returns true iff both operands have the same object id (i.e., if they both refer to the same object). Note that this will return false when comparing two identical copies of the same object.\n\n(Thanks to Ruby Gotchas for this question.)",
                         @"Semicolon followed by an identifier tells us that var is symbol.\nTwo strings with same content may belong to two totally different objetcs but if you convert these two strings to symbol, both of them belongs to the same symbol object.\n\nIf a string is used as a unique identifier then it is always good to define it as a symbol.",
                         @"N/A",
                         @"All methods, no matter the access control, can be accessed within the class. But what about outside callers?\n\nPublic methods enforce no access control -- they can be called in any scope.\n\nProtected methods are only accessible to other objects of the same class.\n\n Private methods are only accessible within the context of the current object.",
                         
                         // Javascript Answers
                         @"All JavaScript objects inherit the properties and methods from their prototype. Objects created using an object literal, or with new Object(), inherit from a prototype called Object.prototype. Objects created with new Date() inherit the Date.prototype. The Object.prototype is on the top of the prototype chain.",
                         
                         @"A “closure” is an expression (typically a function) that can have free variables together with an environment that binds those variables (that “closes” the expression).",
                         
                         @"‘==’ evaluates equality of the value, while ‘===’ evaluates  equality of type and value.",
                         @"Data Types:\n\nUndefined\nNumber\nString\nBoolean\nObject\nFunction\nNull\n",
                         @"Null is used to assign an empty value to a variable and needs to be assigned manually.\nUndefined values result when you declare a variable without assigning it a value. Undefined will be the default whenever you don’t explicitly assign a value.",
                         @"Nan is literally “Not-a-Number”. NaN usually results when either the result or one of the values in an operation is non-numeric.  Even though NaN is not a number, ‘console.log(typeof NaN === “number”);’ logs true, while NaN compared to anything else (including NaN) logs false. The only real way to test if a value is equal to NaN is with the function ‘isNaN()’.",
                         @"Unobtrusive JavaScript is basically a JavaScript methodology that seeks to overcome browser inconsistencies by separating page functionality from structure. The basic premise of unobtrusive JavaScript is that page functionality should be maintained even when JavaScript is unavailable on a user’s browser.",
                         @"Contrary to many object oriented languages, JavaScript is classless and does not support classical inheritance. Because there are no classes, each object is a prototype of another object, and inherits the properties defined in the prototype.\nIn the example below, you can see how ‘dog’ is the prototype for ‘beagle’, which in turn is the prototype for ‘spot’. Any properties defined in dog, such as number of legs, will be inherited by Spot the dog. (Put Image Here!)",
                         @"The keyword ‘this’ in JavaScript refers to the object that a function is a method of. If it’s not specified, it will default to the global object, the window.\nIn the example below, you can see that ‘this’ refers to the box object when it is applied to the width function. When no object is passed in, it will default to the browser window. (Put Image Here!)",

                         @"Setting timers allows you to execute your code at predefined times or intervals.\nThis can be achieved through two main methods: setInterval(); and setTimeout();\nsetInterval() accepts a function and a specified number of milliseconds.\nex) setInterval(function(){alert(“Hello, World!”),10000) will alert the “Hello, World!” function every 10 seconds.\nsetTimeout() also accepts a function, followed by milliseconds. setTimeout() will only execute the function once after the specified amount of time, and will not reoccur in intervals.",
                         @"Yes, JavaScript supports automatic type conversion. In the example below, JavaScript is expecting a string. When it receives a fixnum as an operand, it’s automatically converted to a string.\nex) 5 + “ cats” = “5 cats”",
                         @"if statement\nif – else statement\nif – else if – else statement\nswitch statement",
                         
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
