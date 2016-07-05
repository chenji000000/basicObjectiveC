//
//  main.m
//  day06_5
//
//  Created by student on 15-9-23.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRStudent.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRBook *book=[[TRBook alloc] initWithPrice:18];
        TRStudent *stu=[[TRStudent alloc] initWithAge:18 andBook:book];
        [book show];
        [stu study];
        TRBook *book1=[[TRBook alloc] initWithPrice:30];
        stu=[[TRStudent alloc] initWithAge:18 andBook:book1];
        [book1 show];
        [stu study];
    }
    return 0;
}
