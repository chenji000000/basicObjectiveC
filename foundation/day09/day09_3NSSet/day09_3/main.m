//
//  main.m
//  day09_3
//
//  Created by student on 15-9-29.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRStudent.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //创建
        NSSet *set=[NSSet setWithObjects:@"one",@"two",@"two",@"three",nil];//集合中不能有重复的内容，重复的内容会被删除掉
        NSLog(@"%@",set);
        NSSet *set1=[NSSet setWithSet:set];//生成集合set的副本set1
        
        TRStudent *s1=[[TRStudent alloc] initWithName:@"zhangsan" andAge:18];
         TRStudent *s2=[[TRStudent alloc] initWithName:@"lisi" andAge:22];
        TRStudent *s3=[[TRStudent alloc] initWithName:@"lisi" andAge:22];
        NSArray *stu=@[s1,s2,s3];
        NSSet *set2=[NSSet setWithArray:stu];//用数组来生成集合
        NSLog(@"%@",set2);
        
        //判断一个集合中，是否包含指定的元素
        if([set2 containsObject:s1]==YES)
        {
            NSLog(@"集合set2中包含对象s1");
        }
        //判断两个集合是否相同
        if([set1 isEqualTo:set2]==NO)
        {
            NSLog(@"集合set1与set2不相等");
        }
        //判断一个集合是否为另一个集合的子集
        if([set1 isSubsetOfSet:set2]==NO)
        {
            NSLog(@"集合set1不是集合set2的子集");
        }
        //将一个集合转换成数组
        NSArray *objs=[set2 allObjects];
        NSLog(@"%@",objs);
        //枚举器遍历集合
        NSEnumerator *e=[set2 objectEnumerator];
        TRStudent *s;
        while(s=[e nextObject])
        {
            NSLog(@"%@",s);
        }
        
        NSEnumerator *e1=[set1 objectEnumerator];
        NSString *ss;//NSString是集合里元素的数据类型
        while(ss=[e1 nextObject])
        {
            NSLog(@"%@",ss);
        }
            
            
    }
    return 0;
}
