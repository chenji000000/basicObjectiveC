//
//  main.m
//  day08_6
//
//  Created by student on 15-9-28.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRInteger.h"
#import "TRFloat.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRInteger *i1=[[TRInteger alloc] init];
        i1.integer=10;
        TRInteger *i2=[[TRInteger alloc] init];
        i2.integer=3;
        TRInteger *i3=[[TRInteger alloc] init];
        i3.integer=8;
        TRInteger *i4=[[TRInteger alloc] init];
        i4.integer=17;
        TRInteger *i5=[[TRInteger alloc] init];
        i5.integer=5;


        NSArray *i=@[i1,i2,i3,i4,i5];
        NSArray *sorted=[i sortedArrayUsingSelector:@selector(compareInt:)];//使用sortedArrayUsingSelector这个方法，调用数组TRInteger中的compareInt方法进行排序
        NSLog(@"%@",sorted);

        TRFloat *f1=[[TRFloat alloc] initWithFloat:3.14];
        TRFloat *f2=[[TRFloat alloc] initWithFloat:2.68];
        TRFloat *f3=[[TRFloat alloc] initWithFloat:9.99];
        
        NSArray *f=@[f1,f2,f3];
        NSArray *sorted1=[f sortedArrayUsingSelector:@selector(compareFloat:)];
        NSLog(@"%@",sorted1);
    }
    return 0;
}
