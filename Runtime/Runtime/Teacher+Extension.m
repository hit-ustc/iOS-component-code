//
//  Teacher+Extension.m
//  Runtime
//
//  Created by Aesthetic92 on 16/7/2.
//  Copyright © 2016年 Aesthetic92. All rights reserved.
//

#import "Teacher+Extension.h"
#import <objc/runtime.h>

@implementation Teacher (Extension)


+ (void)load
{
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        Method teaching = class_getInstanceMethod(self, @selector(teaching));
        Method homework = class_getInstanceMethod(self, @selector(homework));
        
        // When swizzling a class method, use the following:
        // Class class = object_getClass((id)self);
        // ...
        // Method originalMethod = class_getClassMethod(class, originalSelector);
        // Method swizzledMethod = class_getClassMethod(class, swizzledSelector);
        
        BOOL didAddMethod = class_addMethod([self class], @selector(teaching), method_getImplementation(homework), method_getTypeEncoding(homework));
        
        if (didAddMethod) {
            class_replaceMethod([self class], @selector(homework), method_getImplementation(teaching), method_getTypeEncoding(teaching));
        } else {
            method_exchangeImplementations(teaching, homework);
        }
        
    });
    
    
}

- (void)setStudents:(NSString *)students
{
    /**
     *  关联对象
     *
     *  @param self     要给哪个对象添加关联对象
     *  @param @sel     关联的key
     *  @param students 关联的value
     *
     */
    objc_setAssociatedObject(self, @selector(students), students, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)students
{
    // 通过key来获取value
    return objc_getAssociatedObject(self, @selector(students));
}

@end
