//
//  main.m
//  Load-Initialize
//
//  Created by Aesthetic92 on 16/7/19.
//  Copyright © 2016年 Aesthetic92. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Parent.h"
#import "Child.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSLog(@"----------main----------");
        
        /*
         *
        1. load和initialize方法都会在实例化对象之前调用，以main函数为分水岭，前者在main函数之前调用，后者在之后调用。这两个方法会被自动调用，不能手动调用它们。
         
        2. load和initialize方法都不用显示的调用父类的方法而是自动调用，即使子类没有initialize方法也会调用父类的方法，而load方法则不会调用父类。
         
        3. load方法通常用来进行Method Swizzle，initialize方法一般用于初始化全局变量或静态变量。
         
        4. load和initialize方法内部使用了锁，因此它们是线程安全的。实现时要尽可能保持简单，避免阻塞线程，不要再使用锁。
         */

        
//        Parent *parent = [[Parent alloc] init];
        
       
        /*
         1. 没有注释load initialize方法
         2016-07-19 13:37:15.515 Load-Initialize[5971:298107] load Parent
         2016-07-19 13:37:15.516 Load-Initialize[5971:298107] load Child
         2016-07-19 13:37:15.517 Load-Initialize[5971:298107] ----------main----------
         2016-07-19 13:37:15.517 Load-Initialize[5971:298107] initialize Parent is Class Parent
         2016-07-19 13:37:15.517 Load-Initialize[5971:298107] initialize Child is Class Child
         
         2. 注释类Child的load方法， 第一行打印的load Parent是第一次加载Parent类时调用(main函数之前)
            Child没有实现load方法，不会调用Parent的load方法
         2016-07-19 13:39:45.719 Load-Initialize[6003:299143] load Parent
         2016-07-19 13:39:45.720 Load-Initialize[6003:299143] ----------main----------
         2016-07-19 13:39:45.721 Load-Initialize[6003:299143] initialize Parent is Class Parent
         2016-07-19 13:39:45.721 Load-Initialize[6003:299143] initialize Child is Class Child
         
         3. 注释类Child的initialize方法，Child继承Parent，初始化时先调用Parent的initialize方法，
            然后Child初始化，虽然没有实现initialize方法，但是会调用Parent的initialize方法
            至于打印不一样 涉及到self 调用机制
         2016-07-19 13:43:04.822 Load-Initialize[6057:300144] load Parent
         2016-07-19 13:43:04.824 Load-Initialize[6057:300144] ----------main----------
         2016-07-19 13:43:04.824 Load-Initialize[6057:300144] initialize Parent is Class Parent
         2016-07-19 13:43:04.824 Load-Initialize[6057:300144] initialize Parent is Class Child
         
         4. 添加Child的分类load，会优先调用分类的initialize方法
         2016-07-19 13:47:53.947 Load-Initialize[6150:302291] load Parent
         2016-07-19 13:47:53.948 Load-Initialize[6150:302291] load Child
         2016-07-19 13:47:53.949 Load-Initialize[6150:302291] load Child (load)
         2016-07-19 13:47:53.950 Load-Initialize[6150:302291] ----------main----------
         2016-07-19 13:47:53.951 Load-Initialize[6150:302291] initialize Parent is Class Parent
         2016-07-19 13:47:53.951 Load-Initialize[6150:302291] initialize Child (load) is Class Child
          */
        
        Child *child = [[Child alloc] init];
        
    }
    return 0;
}
