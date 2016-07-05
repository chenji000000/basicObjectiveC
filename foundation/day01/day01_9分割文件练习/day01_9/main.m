//
//  main.m
//  day01_9
//
//  Created by student on 15-9-17.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRStudent.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRStudent *stu=[TRStudent alloc];
        [stu setName:@"李四"];
        [stu setID:1000];
        [stu setAddress:@"江苏南京"];
        [stu setCScore:100];
        [stu show];
    }
    return 0;
}
