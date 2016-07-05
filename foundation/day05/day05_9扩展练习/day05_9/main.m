//
//  main.m
//  day05_9
//
//  Created by student on 15-9-22.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRMyClass.h"
#import "TRMyClass_add.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRMyClass *m=[[TRMyClass alloc] init];
        m.property=10;
        //m->age=20;
//        m.sex=YES;
        [m method];
//        [m addmethod];
    }
    return 0;
}
