//
//  main.m
//  day08_4
//
//  Created by student on 15-9-28.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //数组的创建
        NSArray *array1=[NSArray array];//创建一个空数组，没有实际意义
        NSArray *array2=[NSArray arrayWithObject:@"one"];//创建一个只有一个元素的数组，意义也不大
        NSArray *array3=[NSArray arrayWithObjects:@"one",@"two",@"three",nil];//创建一个有多个元素的数组，注意nil的作用
        NSLog(@"%@",array3);
        NSArray *array4=@[@"one",@"two",@"three"];//简化后的创建一个有多个元素的数组
         NSLog(@"%@",array4);
        NSArray *array5=[NSArray arrayWithArray:array4];//创建数组Array4的副本
        NSLog(@"%@",array5);
        
        //求数组的长度：数组中的元素个数
        NSUInteger lenth=[array5 count];
        NSLog(@"%lu",lenth);
        
        //通过下标，获取数组中的指定元素
        NSString *objStr=[array5 objectAtIndex:0];//使用实例方法的方式
        NSLog(@"%@",objStr);
        objStr=array5[1];//使用下标的方式
        NSLog(@"%@",objStr);
        //求取数组的最后一个元素
        objStr=[array5 lastObject];
        NSLog(@"%@",objStr);
        //求取数组的第一个元素
        objStr=[array5 firstObject];
        NSLog(@"%@",objStr);
        //求一个数组元素在数组中的下标
        NSUInteger index=[array5 indexOfObject:@"two"];
        NSLog(@"%lu",index);
        index=[array5 indexOfObject:@"5"];//当元素不是数组中的元素时，得到的下标是垃圾值
        NSLog(@"%lu",index);
//        index=-1;
//        NSLog(@"%lu",index);
        
        //数组的遍历
        for(int i=0;i<[array5 count];i++)
        {
            NSLog(@"%@",array5[i]);
        }
    }
    return 0;
}
