//
//  main.m
//  Runtime
//
//  Created by Aesthetic92 on 16/7/1.
//  Copyright © 2016年 Aesthetic92. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <objc/message.h>

// 函数的两个默认参数:self和_cmd
void teaching(id self, SEL _cmd, id course){
    
    // 通过runtime函数获取成员变量 _name
    Ivar nameIvar = class_getInstanceVariable([self class], "_name");
    id name = object_getIvar(self, nameIvar);
    
    // 通过KVC获取成员变量 _age
    NSInteger age = [[self valueForKeyPath:@"age"] integerValue];
    
    NSLog(@"动态添加的%@类名字是%@,年龄:%ld,教%@", [self class], name, age, course);
}

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        // 动态创建一个继承自NSObject的“老师"类
        Class Teachers = objc_allocateClassPair([NSObject class], "Teachers", 0);
        
        // 给“老师"类添加成员变量 _name
        class_addIvar(Teachers, "_name", sizeof(NSString*), log2(sizeof(NSString*)), @encode(NSString*));
        
        // 给“老师”类添加成员变量 _age
        class_addIvar(Teachers, "_age", sizeof(NSInteger), sizeof(NSInteger), @encode(NSInteger));
        
        // 注册一个名为“teaching”的方法
        SEL teach = sel_registerName("teaching");
        
        // 给“老师”类添加方法
        class_addMethod(Teachers, teach, (IMP)teaching, "v@:@");
        
        // 注册“老师”类
        objc_registerClassPair(Teachers);
        
        // 创建类的实例
        id teacher = [[Teachers alloc] init];
        
        // 获取类中指定名称的成员变量的信息
        Ivar nameIvar = class_getInstanceVariable(Teachers, "_name");
        
        // 利用runtime函数为这个成员变量赋值
        object_setIvar(teacher, nameIvar, @"吴教授");
        
        // 利用KVC赋值
        [teacher setValue:@24 forKeyPath:@"age"];
        
        // 给对象发送消息
        objc_msgSend(teacher, teach, @"Objective-C");
        
        // 对象置为nil
        teacher = nil;
        
        // 销毁“老师”类
        objc_disposeClassPair(Teachers);
        
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
