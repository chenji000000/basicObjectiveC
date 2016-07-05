//
//  main.m
//  day05_2
//
//  Created by student on 15-9-22.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SuperMan.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        id<Person,Fly> id1=[[SuperMan alloc] init];
        [id1 job];
        [id1 fly];
    }
    return 0;
}
