//
//  main.m
//  day09_5
//
//  Created by student on 15-9-29.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //创建
        NSMutableSet *set=[NSMutableSet set];//创建了一个空的集合，有意义的，后面可以向其中添加元素
        NSMutableSet *set1=[NSMutableSet setWithCapacity:18];//创建一个预估空间的集合，目的是加快运行速度
        NSMutableSet *set2=[NSMutableSet setWithObjects:@"one",@"two",@"three", nil];//标准方法
        NSLog(@"%@",set2);
        
        //添加元素
        [set addObject:@"one"];//添加一个元素
        NSLog(@"%@",set);
        [set2 addObject:@"four"];
        NSLog(@"%@",set2);
        [set2 addObject:@"one"];
        NSLog(@"%@",set2);
        NSArray *data=@[@"five",@"six",@"seven"];
        [set2 addObjectsFromArray:data];
        NSLog(@"%@",set2);
        
        //删除元素
        [set2 removeObject:@"two"];//删除一个元素
        NSLog(@"%@",set2);
        [set2 removeAllObjects];//一次删除所有元素
        NSLog(@"%lu",[set2 count]);
        
        //交集
        NSMutableSet *set3=[NSMutableSet setWithObjects:@"one",@"two",@"three", nil];
        NSMutableSet *set4=[NSMutableSet setWithObjects:@"one",@"three",@"four", nil];
        [set3 intersectSet:set4];//求set3与set4的交集，运算结果被保存在set3中
        NSLog(@"%@",set3);
        
        //并集
        NSMutableSet *set5=[NSMutableSet setWithObjects:@"one",@"two",@"three", nil];
        [set5 unionSet:set4];//将运算结果放入set5中
        NSLog(@"%@",set5);
        //删除多个元素
        [set5 minusSet:set3];//从set5中删除set3中的所有元素
        NSLog(@"%@",set5);


    }
    return 0;
}
