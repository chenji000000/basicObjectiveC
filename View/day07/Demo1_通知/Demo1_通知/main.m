//
//  main.m
//  Demo1_通知
//
//  Created by tarena on 15/11/4.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Company.h"
#import "VIP.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Company *c=[[Company alloc] init];
        VIP *v1=[[VIP alloc] init];
        VIP *v2=[[VIP alloc] init];
        VIP *v3=[[VIP alloc] init];
        
        [c update];
        //执行完update方法后，v的receiveNewMessage方法就会被自动执行
        
        
        NSLog(@"Hello, World!");
    }
    return 0;
}
