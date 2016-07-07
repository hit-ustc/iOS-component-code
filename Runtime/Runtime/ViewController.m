//
//  ViewController.m
//  Runtime
//
//  Created by Aesthetic92 on 16/7/1.
//  Copyright © 2016年 Aesthetic92. All rights reserved.
//

#import "ViewController.h"
#import "Teacher.h"
#import "Teacher+Extension.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Teacher *teacher = [[Teacher alloc] init];
    
    [teacher AllIvars];
    
    [teacher AllProperties];
    
    [teacher allMethods];
    
    [teacher homework];  // teaching
    
    [teacher teaching];  // homework
    
    teacher.students = @"wu";
    NSLog(@"%@", teacher.students);
    
    [teacher teach];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
