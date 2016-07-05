//
//  main.m
//  day01_3面向对象
//
//  Created by student on 15-9-17.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

struct Example
{
    int i;
    char ch;
};

@interface MyFirstClass : NSObject//MyFirstClass类名
{
    int _i;
    char _ch;
}
-(void)setI:(int)i;//对成员变量_i进行赋值//setI函数名
-(int)i;//对成员变量_i进行访问
-(void)method;//void是函数类型，method是函数名
@end

@implementation MyFirstClass
-(void)setI:(int)i;
{
    _i=i;
}

-(int)i
{
    return _i;
}

-(void)method
{
    NSLog(@"这是一个方法");
}

@end


int main(int argc, const char * argv[]) {
    //MyfirstClass a;//OC的类这种数据类型不能定义存储在栈上的变量，只能定义存储在堆上的变量
    
    MyFirstClass *obj=[MyFirstClass alloc];//函数alloc用于在堆上分配一个变量，即对象//obj对象名
   // obj->_i=10;//在类外不能直接操作类的成员变量
    [obj setI:10];//只能通过成员函数操作成员变量//[对象名 函数名:实参]
    int a=[obj i];
    NSLog(@"%d",a);
    
    struct Example *p=(struct Example*)malloc(sizeof(struct Example));
    p->i=10;
    return 0;
}
