//
//  main.m
//  day04_9图形程序
//
//  Created by student on 15-9-21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRRectangle.h"
#import "TRSquare.h"
#import "TRCircle.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRCircle *circle=[TRCircle circleWithR:10];
        [circle show];
        TRRectangle *rectangle=[TRRectangle rectangleWithX:20 andY:10];
        [rectangle show];
        TRShape *square=[TRSquare squareWithX:20];
        [square show];
    }
    return 0;
}
