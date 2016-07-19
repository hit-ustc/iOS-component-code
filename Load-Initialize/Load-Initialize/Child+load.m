//
//  Child+load.m
//  Load-Initialize
//
//  Created by Aesthetic92 on 16/7/19.
//  Copyright © 2016年 Aesthetic92. All rights reserved.
//

#import "Child+load.h"

@implementation Child (load)

+ (void)load {
    
    NSLog(@"load Child (load)");
}

+ (void)initialize {
    
    NSLog(@"initialize Child (load) is Class %@", [self class]);
}

@end
