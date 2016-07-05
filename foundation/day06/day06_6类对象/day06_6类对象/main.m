//
//  main.m
//  day06_6类对象
//
//  Created by student on 15-9-23.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRStudent.h"
#import "TRTeacher.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRStudent *stu=[[TRStudent alloc] initWithName:@"张三" andID:1000];
        
        Class c=[stu class];//得到一个类对象c,它的值是TRStudent这个类在本工程中的“编号”
        Class c1=[TRStudent class];
        if(c==c1)
        {
            NSLog(@"对象stu 是 类TRStudent的对象");
        }
        else
        {
        NSLog(@"对象stu 不是 类TRStudent的对象");
        }
        
        if([TRTeacher class]==[stu class])
        {
        NSLog(@"对象stu 是 类TRTeacher的对象");
        }
        else
        {
        NSLog(@"对象stu 不是 类TRTeacher的对象");
        }
    }
    return 0;
}
