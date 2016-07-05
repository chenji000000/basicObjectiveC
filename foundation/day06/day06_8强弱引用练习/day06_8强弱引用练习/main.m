//
//  main.m
//  day06_8强弱引用练习
//
//  Created by student on 15-9-23.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRMyClass.h"

void func()
{
    __strong TRMyClass *myClass=[[TRMyClass alloc] init];
    NSLog(@"代码块末尾");
}

void func2()
{
    __strong TRMyClass *myClass2=nil;
    if(1==1)
    {
        __strong TRMyClass *myClass=[[TRMyClass alloc] init];
        myClass2=myClass;
        NSLog(@"代码块末尾");
    }
    [myClass2 method];
    NSLog(@"代码块2末尾");
}

void func3()
{
    __weak TRMyClass *myClass2=nil;
    if(1==1)
    {
        __strong TRMyClass *myClass=[[TRMyClass alloc] init];
        myClass2=myClass;
        NSLog(@"myClass2:%p",myClass2);
        [myClass2 method];
        NSLog(@"代码块末尾");
    }
    NSLog(@"myClass2:%p",myClass2);
    [myClass2 method];
    NSLog(@"代码块末尾");
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        func();
        NSLog(@"---------------");
        func2();
        NSLog(@"---------------");
        func3();
    }
    return 0;
}
