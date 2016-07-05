//
//  main.m
//  day02_12
//
//  Created by student on 15-9-18.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TREmployee.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TREmployee *e=[[TREmployee alloc] init];
        e.name=@"张三";
        [e show];//用对象调用实例方法
        //[e classMethod];//类方法不能用对象调用
        [TREmployee classMethod];
    }
    return 0;
}
