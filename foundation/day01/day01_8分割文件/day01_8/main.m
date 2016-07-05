//
//  main.m
//  day01_8
//
//  Created by student on 15-9-17.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TREmployee.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TREmployee *e=[TREmployee alloc];
        [e setName:@"张三"];
        [e setAge:28];
        [e setGender:YES];
        [e setSalary:6000];
        [e show];
    }
    return 0;
}
