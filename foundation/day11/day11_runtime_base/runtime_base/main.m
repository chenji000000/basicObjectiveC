//
//  main.m
//  runtime_base
//
//  Created by tarena on 15/10/8.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRStudent.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        [TRStudent test];
//        TRStudent *st=[[TRStudent alloc] init];
//        SEL sel=@selector(test);
//       
//        IMP imp=[st methodForSelector:sel];
//        imp(st,sel);
//        [st performSelector:sel];
//        [st test];
        TRStudent *st1=[[TRStudent alloc] init];
//        Class cl=[st class];
        Class cl2=[st1 class];
        TRStudent *st=[[cl2 alloc] init];
        [st test];
//        NSLog(@"%p=%p",cl,cl2);
//        [receive message];
    }
    return 0;
}
