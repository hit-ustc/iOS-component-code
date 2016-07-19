//
//  Parent.m
//  Load-Initialize
//
//  Created by Aesthetic92 on 16/7/19.
//  Copyright © 2016年 Aesthetic92. All rights reserved.
//

#import "Parent.h"

@implementation Parent

+ (void)load {
    
    NSLog(@"load Parent");
}

+ (void)initialize {
    
    NSLog(@"initialize Parent is Class %@", [self class]);
}

@end
