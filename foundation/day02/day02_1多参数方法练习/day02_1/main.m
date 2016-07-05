//
//  main.m
//  day02_1
//
//  Created by student on 15-9-18.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRTime.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRTime *t=[TRTime alloc];
        [t setHour:10 andsetMinute:20 andsetSecond:30];
        [t show];
        //[t seconds];//seconds是类TRTime的私有函数，不能在类外使用
        [t printSeconds];
    }
    return 0;
}
