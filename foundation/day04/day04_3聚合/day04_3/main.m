//
//  main.m
//  day04_3
//
//  Created by student on 15-9-21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRcomputer.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRMouse *mouse=[[TRMouse alloc] init];
        {
            TRcomputer *com=[[TRcomputer alloc] init];
            com.mouse=mouse;
        }
        NSLog(@"--------------");
    }
    return 0;
}
