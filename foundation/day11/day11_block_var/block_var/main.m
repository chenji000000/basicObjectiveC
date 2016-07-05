//
//  main.m
//  block_var
//
//  Created by tarena on 15/10/8.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int var_a=20;
        __block int var_b=30;
        
        NSLog(@"outside var_a address %p",&var_a);
        //在block里可以访问block语句外局部变量，只能读取，不能写
        void(^visit_var)();
        visit_var=^{
 //           var_a=10;
            var_b=40;
            NSLog(@"var_a=%d",var_a);
            NSLog(@"inside var_a address %p",&var_a);
            NSLog(@"var_b=%d",var_b);
        };
        visit_var();
    }
    return 0;
}
