//
//  main.m
//  day09_6
//
//  Created by student on 15-9-29.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRStudent.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRStudent *stu1=[[TRStudent alloc] initWithName:@"zhangsan" andAge:18];
        TRStudent *stu2=[[TRStudent alloc] initWithName:@"lisi" andAge:22];
        //字典的创建
        NSDictionary *dict=[NSDictionary dictionaryWithObjectsAndKeys:stu1,@"1",stu2,@"2", nil];//标准方法
        NSLog(@"%@",dict);
        NSArray *objects=@[stu1,stu2];//值数组
        NSArray *keys=@[@"1",@"2"];//键数组
        NSDictionary *dict1=[NSDictionary dictionaryWithObjects:objects forKeys:keys];//用数组方式创建字典
         NSLog(@"%@",dict1);
        NSDictionary *dict2=[NSDictionary dictionaryWithDictionary:dict1];//创建字典dict1的副本
        NSLog(@"%@",dict2);
        
        //求字典中键值对的个数
        NSLog(@"%lu",[dict2 count]);
        
    }
    return 0;
}
