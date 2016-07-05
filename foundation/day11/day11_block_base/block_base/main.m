//
//  main.m
//  block_base
//
//  Created by tarena on 15/10/8.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>



int main(int argc, const char * argv[]) {
    
    
    @autoreleasepool {
        //myfunc是指针类型的变量
 //       void(*myfunc)();
        //myblock是block类型的变量,
        //第一个block，无参的block
        void (^myblock)();
        myblock=^{
            NSLog(@"hello tarena");
        };
        myblock();
//        第二个有参block的使用
        typedef int(^mathblock)(int x,int y);
        //mathblock是类型，不是变量
        mathblock mt;
        
        mt=^(int x,int y){
            return x+y;
        };
        int result=mt(3,5);
        NSLog(@"result=%d",result);
    }
    
    return 0;
}
