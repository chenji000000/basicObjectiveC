//
//  main.m
//  day08_5
//
//  Created by student on 15-9-28.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRStudent.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int i=10;
        NSNumber *oi=[NSNumber numberWithInt:i];
        char c='a';
        NSNumber *oc=[NSNumber numberWithChar:c];
        float f=10.1f;
        NSNumber *of=[NSNumber numberWithFloat:f];
        TRStudent *stu=[[TRStudent alloc] init];
        stu.name=@"zhangsan";
        stu.age=20;
        NSLog(@"%@",stu);
        
        NSArray *array=@[oi,oc,of,stu];
        NSLog(@"%@",array);
               
    }
    return 0;
}
