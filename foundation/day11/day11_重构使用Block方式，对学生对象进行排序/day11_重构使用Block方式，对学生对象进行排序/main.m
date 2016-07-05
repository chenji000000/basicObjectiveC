//
//  main.m
//  day11_重构使用Block方式，对学生对象进行排序
//
//  Created by tarena on 15/10/8.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRStudent.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRStudent *stu1=[[TRStudent alloc] init];
        stu1.age=18;
        stu1.name=@"zhangsan";
        
        TRStudent *stu2=[[TRStudent alloc] init];
        stu2.age=19;
        stu2.name=@"lisi";
        
        TRStudent *stu3=[[TRStudent alloc] init];
        stu3.age=20;
        stu3.name=@"wangwu";
        
        //创建排序Block
        NSComparisonResult(^compare)(id stu1,id stu2);
        compare=^(id stu1,id stu2)
        {
        //类型转换
            NSString* s1=nil;
            if([stu1 isMemberOfClass:[TRStudent class]])
            {
                s1=((TRStudent*)stu1).name;
            }
            NSString* s2=nil;
            if([stu2 isMemberOfClass:[TRStudent class]])
            {
                s2=((TRStudent*)stu2).name;
            }
            return [s1 compare:s2];
        };
        
    //创建字典，并对关键字排序
        NSDictionary* dict=[NSDictionary dictionaryWithObjectsAndKeys:stu1,@"1",stu2,@"2",stu3,@"3", nil];
        NSLog(@"dictionary:%@",dict);
        NSArray* array=[dict keysSortedByValueUsingComparator:compare];
        
        //按照排好序的关键字输出字典的值value
        for(NSString *stu in array)
            NSLog(@"%@",[dict objectForKey:stu]);
    }
    return 0;
}
