//
//  main.m
//  day10_3
//
//  Created by tarena on 15/9/30.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRStudent.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRStudent *stu1=[[TRStudent alloc] initWithName:@"zhangsan" andAge:18];
        TRStudent *stu2=[[TRStudent alloc] initWithName:@"lisi" andAge:22];
        TRStudent *stu3=[[TRStudent alloc] initWithName:@"wangwu" andAge:20];
        TRStudent *stu4=[[TRStudent alloc] initWithName:@"zhaoliu" andAge:23];
        TRStudent *stu5=[[TRStudent alloc] initWithName:@"qianqi" andAge:18];
        TRStudent *stu6=[[TRStudent alloc] initWithName:@"guanyu" andAge:35];
        TRStudent *stu7=[[TRStudent alloc] initWithName:@"zhangfei" andAge:32];
        TRStudent *stu8=[[TRStudent alloc] initWithName:@"zhaoyun" andAge:18];
        
        NSMutableDictionary *class1=[NSMutableDictionary dictionaryWithObjectsAndKeys:stu1,@"1",stu2,@"2", nil];
        NSMutableDictionary *class2=[NSMutableDictionary dictionaryWithObjectsAndKeys:stu3,@"3",stu4,@"4", nil];
        NSMutableDictionary *class3=[NSMutableDictionary dictionaryWithObjectsAndKeys:stu5,@"5",stu6,@"6", nil];
        NSMutableDictionary *class4=[NSMutableDictionary dictionaryWithObjectsAndKeys:stu7,@"7",stu8,@"8", nil];
        
        NSMutableDictionary *college1=[NSMutableDictionary dictionaryWithObjectsAndKeys:class1,@"1",class2,@"2", nil];
        NSMutableDictionary *college2=[NSMutableDictionary dictionaryWithObjectsAndKeys:class3,@"3",class4,@"4", nil];
        
        NSMutableDictionary *school=[NSMutableDictionary dictionaryWithObjectsAndKeys:college1,@"1",college2,@"2", nil];
        
        for(NSString *college in school)
        {
        for(NSString *class in school[college])
        {
        for(NSString *stu in school[college][class])
        {
            NSLog(@"%@=%@",stu,school[college][class][stu]);
        }
        }
        }
        
    }
    return 0;
}
