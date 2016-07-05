//
//  main.m
//  day02_2
//
//  Created by student on 15-9-18.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRLocation.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRLocation *l=[TRLocation alloc];//对象l中的x,y被分配了存储空间（堆区），此时被称为实例变量
        [l setX:10];
        [l setY:20];
        [l show];
        [l moveUp];
        [l moveDown];
        [l moveLeft];
        [l moveRight];
        
    }
    return 0;
}
