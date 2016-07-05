//
//  main.m
//  day06_4
//
//  Created by student on 15-9-23.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRStudent.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRStudent *stu=[[TRStudent alloc] initWithName:@"张三" andID:1000 andAge:20];
        [stu show];
        TRStudent *stu1=[stu copy];
        [stu1 show];
        
    }
    return 0;
}
