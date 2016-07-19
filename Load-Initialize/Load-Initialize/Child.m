//
//  Child.m
//  Load-Initialize
//
//  Created by Aesthetic92 on 16/7/19.
//  Copyright © 2016年 Aesthetic92. All rights reserved.
//

#import "Child.h"

@implementation Child

+ (void)load {
    
    NSLog(@"load Child");
}

+ (void)initialize {
    
    NSLog(@"initialize Child is Class %@", [self class]);
}

@end
