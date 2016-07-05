//
//  main.m
//  day02_4
//
//  Created by student on 15-9-18.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRFrection2.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRFrection2 *f=[TRFrection2 alloc];
        f.n=1;//f.n被编译成[f setN:1];
        //[f setN:1];
        f.d=3;
        //[f setD:3];
        NSLog(@"%d/%d",f.n,f.d);//f.n被编译成[f n]
        [f show];
    }
    return 0;
}
