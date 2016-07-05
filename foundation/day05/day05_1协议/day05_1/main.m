//
//  main.m
//  day05_1
//
//  Created by student on 15-9-22.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRMyProtocol.h"
#import "TRMyClass.h"
#import "TRProtocol1.h"
#import "TRMyClass1.h"
#import "TRProtocol2.h"
#import "TRClassA.h"
#import "TRProtocol4.h"
#import "TRClassB.h"

void test()
{
    id<TRMyProtocol> ref=[[TRMyClass alloc] init];
    ref.content=@"属性值";
    [ref show];
    
    id<TRProtocol1> ref1=[[TRMyClass1 alloc] init];
    [ref1 method1];
}

void test1()
{
    id<TRProtocol1> id1=[[TRClassA alloc] init];
    //[id1 method];//非协议中的方法不能用id1调用
    [id1 method1];
   // [id1 method2];//method2没有在协议TRProtocol1中定义
    id<TRProtocol2> id2=[[TRClassA alloc] init];
    [id2 method1];
    [id2 method2];
}

void test2()
{
    TRClassB *obj=[[TRClassB alloc] init];
    id<TRProtocol1> id1=obj;
    [id1 method1];
    //[id1 method2];
    //[id1 method3];
    //[id1 method4];
    
    id<TRProtocol2> id2=obj;
    [id2 method1];
    [id2 method2];
    //[id2 method3];
    //[id2 method4];
    
    id<TRProtocol3> id3=obj;
//    [id3 method1];
//    [id3 method2];
    [id3 method3];
//    [id3 method4];

    id<TRProtocol4> id4=obj;
    [id4 method1];
    [id4 method2];
    [id4 method3];
    [id4 method4];


}

void test3()
{
    id<TRProtocol2> b[2];//协议数组，数组中的每个元素都是一个指针
    b[0]=[[TRClassA alloc] init];
    [b[0] method1];
    b[1]=[[TRClassB alloc] init];
    [b[1] method1];
}

void fa(id<TRProtocol1> ida)//协议指针作为函数的形参
{
    [ida method1];
}
void test4()
{
    fa([[TRClassA alloc] init]);//遵守协议的类的对象作为实参
}

id<TRProtocol1> fb(int type)//返回值是一个协议指针
{
switch(type)
    {
        case 0:
            return [[TRClassA alloc] init];
        case 1:
            return [[TRClassB alloc] init];
    }
    return nil;
}
void test5()
{
    id<TRProtocol1> id1=fb(1);//fb(1)返回的是TRClassB的对象
    [id1 method1];
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        test();
//        test4();
        test5();
    }
    return 0;
}
