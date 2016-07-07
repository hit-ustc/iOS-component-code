//
//  Teacher.m
//  Runtime
//
//  Created by Aesthetic92 on 16/7/2.
//  Copyright © 2016年 Aesthetic92. All rights reserved.
//

#import "Teacher.h"
#import "Student.h"
#import <objc/message.h>

@interface Teacher()

{
    NSString *wage;
}

@end

@implementation Teacher


- (void)teaching
{
    NSLog(@"teaching");
}

- (void)homework
{
    NSLog(@"homework");
}

// 获取所有的成员变量
- (void)AllIvars
{
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList(self.class, &count);
    
    for (int i = 0; i < count; ++i) {
        Ivar ivar = ivars[i];
        const char *ivarName = ivar_getName(ivar);
        NSLog(@"ivarName:%s", ivarName);
    }
    
    free(ivars);

}

// 获取所有的属性
- (void)AllProperties
{
    unsigned int count = 0;
    objc_property_t *properties = class_copyPropertyList(self.class, &count);
    
    for (int i = 0; i < count; ++i) {
        objc_property_t property = properties[i];
        const char *propertyName = property_getName(property);
        NSLog(@"propertyName:%s", propertyName);
    }
    
    free(properties);
    
}

// 获取所有的方法
- (void)allMethods
{
    unsigned int count = 0;
    Method *methods = class_copyMethodList(self.class, &count);
    
    for (int i = 0; i < count; ++i) {
        Method method = methods[i];
        SEL methodName = method_getName(method);
        NSLog(@"methodName:%@", NSStringFromSelector(methodName));
    }
    
    free(methods);
}



//  自己教书
//+ (BOOL)resolveInstanceMethod:(SEL)sel
//{
//    if ([NSStringFromSelector(sel) isEqualToString:@"teach"]) {
//        class_addMethod(self, sel, (IMP)teach, "v@:");
//        return YES;
//    }
//    
//    return [super resolveInstanceMethod:sel];
//}
//
//void teach(id self, SEL cmd)
//{
//    NSLog(@"Teacher teaching");
//}



// Student教书
//+ (BOOL)resolveInstanceMethod:(SEL)sel
//{
//    return NO;
//}
//
//- (id)forwardingTargetForSelector:(SEL)aSelector
//{
//    Student *stu = [[Student alloc] init];
//    return stu;
//}

// 完整的消息转发

// 第一步，不动态添加方法，返回NO
+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    return NO;
}

// 第二步，不备选提供响应aSelector的对象，置为nil，就会进入第三步
- (id)forwardingTargetForSelector:(SEL)aSelector
{
    return nil;
}

// 第三步，先返回方法选择器。如果返回nil，则表示无法处理消息
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    if ([NSStringFromSelector(aSelector) isEqualToString:@"teach"]) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    
    return [super methodSignatureForSelector:aSelector];
}

// 第四步，只有返回了方法签名，都会进入这一步，这一步用户调用方法、改变调用对象等
- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    // 改变方法选择器
    [anInvocation setSelector:@selector(invocation)];
    
    //  指定哪个对象处理方法
    [anInvocation invokeWithTarget:self];
}

// 没找到invocation方法就会执行
- (void)doesNotRecognizeSelector:(SEL)aSelector
{
    NSLog(@"无法处理消息：%@", NSStringFromSelector(aSelector));
}

- (void)invocation
{
    NSLog(@"invocation");
}

@end
