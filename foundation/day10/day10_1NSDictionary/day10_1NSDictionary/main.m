//
//  main.m
//  day10_1NSDictionary
//
//  Created by tarena on 15/9/30.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRStudent.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRStudent *stu1=[[TRStudent alloc] initWithName:@"z" andAge:18];
        TRStudent *stu2=[[TRStudent alloc] initWithName:@"x" andAge:20];
        TRStudent *stu3=[[TRStudent alloc] initWithName:@"y" andAge:19];
        NSDictionary *dict1=[NSDictionary dictionaryWithObjectsAndKeys:stu1,@"1",stu2,@"2",stu3,@"3",stu1,@"4", nil];
        //获取字典中的所有关键字
        NSArray *keys=[dict1 allKeys];
        NSLog(@"%@",keys);
        
        //获取字典中的所有值的内容
        NSArray *values=[dict1 allValues];
        NSLog(@"%@",values);
        
        //根据关键字，求相应的值的内容
        NSLog(@"%@",[dict1 objectForKey:@"1"]);
        
        //根据值的内容，求相应的关键字
        NSArray *keys1=[dict1 allKeysForObject:stu1];//由于值可以重复，所以可能会有多个关键字对应同一个值，所以该方法的返回值是一个数组
        NSLog(@"%@",keys1);
        
        //根据多个key找多个value
        NSArray *keys2=@[@"1",@"5"];
        NSArray *values1=[dict1 objectsForKeys:keys2 notFoundMarker:@"no-found"];
        NSLog(@"%@",values1);

       //字典创建的简化方法
        NSDictionary *dict2=@{@"1":stu1,@"2":stu2,@"3":stu3};
        NSLog(@"%@",dict2);
        //简化的通过key找到value
        NSLog(@"%@",dict2[@"1"]);
        
        NSArray *sortedkey=[dict2 keysSortedByValueUsingSelector:@selector(compareName:)];
        for(int i=0;i<[sortedkey count];i++)
        {
            NSLog(@"%@",dict2[sortedkey[i]]);
        }
        NSArray *sortedAge=[dict2 keysSortedByValueUsingSelector:@selector(compareAge:)];
        for(int i=0;i<[sortedAge count];i++)
        {
            NSLog(@"%@",dict2[sortedAge[i]]);
        }
        
        //遍历
        //普通
        NSArray *keys3=[dict2 allKeys];
        for(int i=0;i<[keys3 count];i++)
        {
            NSLog(@"%@=%@",keys3[i],dict2[keys3[i]]);
        }
         //枚举器：所有value
        NSEnumerator *e1=[dict2 objectEnumerator];
        TRStudent *stu;
        while(stu=[e1 nextObject])
        {
            NSLog(@"%@",stu);
        }
        //枚举器：所有key
        NSEnumerator *e2=[dict2 keyEnumerator];
        NSString *key;
        while(key=[e2 nextObject])
        {
            NSLog(@"%@",key);
        }
      //快速：只能遍历key
        for(NSString *key in dict2)
        {
           NSLog(@"%@=%@",key,dict2[key]);
        }
        //将字典的内容写入文件
        NSDictionary *dict3=[NSDictionary dictionaryWithObjectsAndKeys:@"string1",@"1",@"string2",@"2",@"string3",@"3",nil];
        [dict3 writeToFile:@"/Users/tarena/Desktop/dict.plist" atomically:YES];
        
        //用文件中的内容生成字典
        NSDictionary *dict4=[NSDictionary dictionaryWithContentsOfFile:@"/Users/tarena/Desktop/dict.plist"];
        NSLog(@"%@",dict4);
    }
    return 0;
}
