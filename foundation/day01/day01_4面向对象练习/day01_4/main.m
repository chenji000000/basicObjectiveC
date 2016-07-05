//
//  main.m
//  day01_4
//
//  Created by student on 15-9-17.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRDog : NSObject
{
    int _age;
}
-(void)setAge:(int)age;
-(int)getAge;
-(void)bark;
@end

@implementation TRDog

-(void)setAge:(int)age
{
    _age=age;
}
-(int)getAge
{
    return _age;
}

-(void)bark
{
    NSLog(@"汪汪");
}

@end



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRDog *dog=[TRDog alloc];
        //dog->_age=10;
        [dog setAge:10];
        NSLog(@"狗的年龄是：%d",[dog getAge]);
        [dog bark];
        [dog setAge:5];
        NSLog(@"狗的年龄是：%d",[dog getAge]);
        
        TRDog *dog1=[TRDog alloc];
        [dog1 setAge:15];
        NSLog(@"狗的年龄是：%d",[dog1 getAge]);
        [dog1 bark];
    }
    return 0;
}
