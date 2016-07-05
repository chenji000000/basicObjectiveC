//
//  main.m
//  day02_6
//
//  Created by student on 15-9-18.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRStudent.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRStudent *stu=[TRStudent alloc];
        stu.name=@"张三";
        stu.age=28;
        stu.gender=YES;
        stu.salary=6000;
        [stu show];
    }
    return 0;
}
