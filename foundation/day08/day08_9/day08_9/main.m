//
//  main.m
//  day08_9
//
//  Created by student on 15-9-28.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int i=10;
        //封装
        NSNumber *intNum=[NSNumber numberWithInt:i];
        //拆封
        int i2=[intNum intValue];
        NSLog(@"%d",i2);
        
        char c='a';
        //封装
        NSNumber *charNum=[NSNumber numberWithChar:c];
        //拆封
        char c2=[charNum charValue];
        NSLog(@"%c",c2);
        
        
    }
    return 0;
}
