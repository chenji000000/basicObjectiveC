//
//  main.m
//  day10_2NSMutableDictionary
//
//  Created by tarena on 15/9/30.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       //创建方法
        NSMutableDictionary *dict=[NSMutableDictionary dictionary];//创建一个空字典，有意义的，在后面可以向字典中添加键值对
        NSMutableDictionary *dict1=
        [NSMutableDictionary dictionaryWithCapacity:18];//预估值
        NSMutableDictionary *dict2=[NSMutableDictionary dictionaryWithObjectsAndKeys:@"one",@"1",@"two",@"2", nil];//标准方法
        
        //添加方法
        [dict2 setValue:@"Three" forKey:@"3"];//添加一个键值对
        NSLog(@"%@",dict2);
        NSMutableDictionary *dict3=[NSMutableDictionary dictionary];
        [dict3 addEntriesFromDictionary:dict2];//将一个字典中的键值对，放入另一个字典中
        
        //覆盖：替换
        NSDictionary *dict4=[NSDictionary dictionaryWithObjectsAndKeys:@"aaa",@"1",@"bbb",@"2",@"ccc",@"3", nil];
        [dict3 setDictionary:dict4];//用dict4中的所有键值对，替换dict3中的所有键值对
        NSLog(@"%@",dict3);
        
        //删除
        [dict3 removeObjectForKey:@"1"];//根据key来删除一个键值对
        NSLog(@"%@",dict3);
        NSArray *keys=@[@"2",@"3"];
        [dict3 removeObjectsForKeys:keys];//根据key数组删除多个键值对
        NSLog(@"%lu",[dict3 count]);
        [dict3 removeAllObjects];//清除字典中的所有键值对
    }
    return 0;
}
