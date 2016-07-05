//
//  main.m
//  day02_3
//
//  Created by student on 15-9-18.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRExample.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRExample *e=[TRExample alloc];
        //e->_i0=10;//_i0是保护的，不能被访问，类内使用
        e->_i1=20;//_i1公有的：类内类外都能使用
        e->_i2=30;//_i2是包内的
        //e->_i3=40;//_i3是保护的
        //e->_i4=50;//_i4是私有的
        //e->_i5=60;//_i5被定义在.m文件中，是私有的
    }
    return 0;
}
