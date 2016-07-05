//
//  main.m
//  day05_8扩展
//
//  Created by student on 15-9-22.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRFraction.h"
#import "TRFraction_exam.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRFraction *f=[[TRFraction alloc] init];
        f.n=1;
        f.d=3;
       // f->a=10;
        f->c=20;
        [f show];
        [f extensionMethod0];
        //[f method2];//私有的方法
    }
    return 0;
}
