//
//  main.m
//  day08_1NSValue
//
//  Created by student on 15-9-28.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct
{
    int x;
    int y;
}Point2;

typedef struct
{
    int age;
    bool gender;
    double salary;
}Student;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Point2 point;
        point.x=10;
        point.y=20;
        
        NSValue *value=[NSValue valueWithBytes:&point objCType:@encode(Point2)];//（第一个空写结构体变量的地址，第二个空写数据类型的编号，encode分配存储空间）将一个结构体变量封装成OC类的对象
        
        Point2 point2;
        [value getValue:&point2];//将一个OC类的对象拆封成一个结构体变量
        NSLog(@"(%d,%d)",point2.x,point2.y);
        
        
        Student stu1;//不要加*，放在栈上
        stu1.age=20;
        stu1.gender=true;
        stu1.salary=2000;
        
        NSValue *value1=[NSValue valueWithBytes:&stu1 objCType:@encode(Student)];
        
        Student stu2;
        [value1 getValue:&stu2];//实例方法
        NSLog(@"%d,%d,%lf",stu2.age,stu2.gender,stu2.salary);
        
    }
    return 0;
}
