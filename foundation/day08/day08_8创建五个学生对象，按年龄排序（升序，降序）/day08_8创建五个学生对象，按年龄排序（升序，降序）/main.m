//
//  main.m
//  day08_8创建五个学生对象，按年龄排序（升序，降序）
//
//  Created by student on 15-9-28.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRStudent.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //定义五个对象
        TRStudent *stu1=[[TRStudent alloc] initWithAge:18 andName:@"zhangsan"];
        TRStudent *stu2=[[TRStudent alloc] initWithAge:21 andName:@"lisi"];
        TRStudent *stu3=[[TRStudent alloc] initWithAge:20 andName:@"wangwu"];
        TRStudent *stu4=[[TRStudent alloc] initWithAge:25 andName:@"zhaoliu"];
        TRStudent *stu5=[[TRStudent alloc] initWithAge:23 andName:@"qianqi"];
        
        //生成数组
        NSArray *stu=@[stu1,stu2,stu3,stu4,stu5];
        NSLog(@"stu:%@",stu);
        
        //升序排序后的数组
        NSArray *astu=[stu sortedArrayUsingSelector:@selector(compareAscending:)];
        NSLog(@"astu:%@",astu);
        
        //降序排序后的数组
        NSArray *dstu=[stu sortedArrayUsingSelector:@selector(compareDescending:)];
        NSLog(@"dstu:%@",dstu);

        
    }
    return 0;
}
