//
//  main.m
//  day07_9独立实现重构Student和Book类
//
//  Created by student on 15-9-24.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRStudent.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRStudent *stu=[[TRStudent alloc] initWithAge:20 andGender:'M' andSalary:8000];
        TRStudent *stu1=[stu copy];
        [stu1 printInfo];
    }
    return 0;
}
