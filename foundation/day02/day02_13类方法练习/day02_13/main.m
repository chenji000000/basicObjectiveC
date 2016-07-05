//
//  main.m
//  day02_13
//
//  Created by student on 15-9-18.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRStudent.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRStudent *stu=[[TRStudent alloc] init];
        stu.name=@"张三";
        [stu show];
        [TRStudent hobby];
    }
    return 0;
}
