//
//  main.m
//  day06_1
//
//  Created by student on 15-9-23.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRPoint.h"

void test1()
{
    TRPoint *p=[TRPoint pointWithX:10 andY:20];
    [p show];
    //[p release];//ARC不用写
}//函数结束时，ARC自动添加[p release];

void test2()
{
    TRPoint *p1=nil;
    {
        TRPoint *p2=[[TRPoint alloc] initWithX:30 andY:40];
        [p2 show];
        p1=p2;
        //[p1 retain];//ARC自动添加的，不需要手动添加
    }//ARC自动添加了[p2 release];
    NSLog(@"-------------");
}//ARC自动添加[p1 release];

void test3()
{
    TRPoint *p1=[TRPoint pointWithX:10 andY:20];
    {
        TRPoint *p2=[TRPoint pointWithX:30 andY:40];
        //[p1 release];//ARC自动添加
        p1=p2;
        //[p1 retain];//ARC自动添加
    }
}

void test4()
{
    //auto int a;
    //@autoreleasepool?
    {
        __strong TRPoint *p=[TRPoint pointWithX:10 andY:20];
        [p show];//（__strong编译器自动添加）ARC自动添加__strong关键字
    }//ARC自动添加[p release];

}

void test5()
{
    __weak TRPoint *p1=nil;
    @autoreleasepool
    {
        TRPoint *p2=[TRPoint pointWithX:10 andY:20];
        [p2 show];
        p1=p2;//ARC不会自动添加[p1 retain];
        NSLog(@"%@",p1);
    }//ARC自动添加[p2 release];,还自动添加p1=nil;
    NSLog(@"%@",p1);
}

void test6()
{
     @autoreleasepool {
    
    TRPoint *p1=[[TRPoint alloc]initWithX:10 andY:20];
    __weak TRPoint *p2;//__unsafe_unretained不会赋值空，作用和weak相同
    p2=p1;//ARC不会自动添加[p2 retain];
    //ARC自动添加[p1 release];还会自动添加p2=nil;
    p1=[TRPoint pointWithX:30 andY:40];
    
    NSLog(@"%@",p2);
        }
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //test4();
        // test5();
        test6();
    }
    return 0;
}
