//
//  main.m
//  day07_8
//
//  Created by student on 15-9-24.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //封装
        NSNumber *i=[NSNumber numberWithInt:-10];//将常量-10封装成一个对象i
        NSLog(@"%@",i);
        int a=100;
        NSNumber *i1=[NSNumber numberWithInt:a];//将一个变量a封装成一个对象i1
        NSLog(@"%@",i1);
        
        //拆封
        int b=[i intValue];//将对象i中封装的值拆封出来
        NSLog(@"%d",b);
        b=[i1 intValue];
        NSLog(@"%d",b);
        
        NSNumber *i2=[NSNumber numberWithChar:'a'];
        NSLog(@"%@",i2);
        char c=[i2 charValue];
        NSLog(@"%c",c);
        
        float f=3.14;
        NSNumber *i3=[NSNumber numberWithFloat:f];
        NSLog(@"%@",i3);
        float f1=[i3 floatValue];
        NSLog(@"%f",f1);
        
        BOOL bool1=YES;
        NSNumber *i4=[NSNumber numberWithBool:bool1];
        NSLog(@"%@",i4);
        BOOL bool2=[i4 boolValue];
        NSLog(@"%d",bool2);
    }
    return 0;
}
