//
//  Teacher.h
//  Runtime
//
//  Created by Aesthetic92 on 16/7/2.
//  Copyright © 2016年 Aesthetic92. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Teacher : NSObject

{
    NSString *course;
}

@property(nonatomic, copy) NSString *name;

@property(nonatomic, assign) NSUInteger age;

@property(nonatomic, assign) NSUInteger height;


- (void)AllIvars;
- (void)AllProperties;
- (void)teaching;
- (void)homework;
- (void)allMethods;

- (void)teach;

@end
