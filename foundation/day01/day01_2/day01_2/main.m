//
//  main.m
//  day01_2
//
//  Created by student on 15-9-17.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //C语言风格的布尔类型
        bool b=true;
        b=false;
        b=12345;
        //OC中的布尔类型
        BOOL y;
        y=YES;//真
        y=NO;//假
        NSLog(@"YES:%d",YES);
        NSLog(@"NO:%d",NO);
        
        //y=12345;
        //不能随便将一个整数赋值给布尔类型变量
        
        NSLog(@"y=%d",y);
        NSLog(@"%ld",sizeof(y));

        
    }
    return 0;
}
