//
//  main.m
//  day09_1
//
//  Created by student on 15-9-29.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //创建
        NSMutableArray *array=[NSMutableArray array];//创建一个空的可变数组，有意义的，在后续程序中可以向其中添加元素（修改内存，效率变低）
        NSMutableArray *array1=[NSMutableArray arrayWithCapacity:18];//使用预估值，预先分配18个元素的存储空间，当向数组中添加元素时，效率会高一些
        NSMutableArray *array2=@[@"one",@"two",@"three"];//使用字面值会使可变数组array2退化成不可变数组
        NSMutableArray *array3=[NSMutableArray arrayWithObjects:@"one",@"two",@"three",nil];//标准方法
        
        //向可变数组中添加元素
        [array addObject:@"one"];//在数组的末尾添加一个元素
        NSLog(@"%@",array);
        [array addObject:@"two"];
        NSLog(@"%@",array);
        [array insertObject:@"three" atIndex:0];
        NSLog(@"%@",array);
        [array insertObject:@"four" atIndex:1];
        NSLog(@"%@",array);
        [array insertObject:@"five" atIndex:4];//下标越界会导致崩溃
        NSLog(@"%@",array);

      //修改数组元素
        [array replaceObjectAtIndex:0 withObject:@"aaa"];//修改指定下标的数组元素，仅修改一个元素
        NSLog(@"%@",array);
        NSMutableArray *replace=[NSMutableArray arrayWithObjects:@"six",@"seven",@"eight",nil];
        NSRange r={1,2};//范围中1为开始的下标，2为连续的元素个数
        [array replaceObjectsInRange:r withObjectsFromArray:replace];//修改指定范围的数组元素，对多个数组元素进行修改
        NSLog(@"%@",array);
        
     //删除数组元素
        NSMutableArray *array4=[NSMutableArray arrayWithObjects:@"one",@"two",@"three",nil];
        [array4 removeLastObject];//删除最后一个元素
        NSLog(@"%@",array4);
        [array4 removeObject:@"two"];//删除指定对象
        NSLog(@"%@",array4);
        [array removeObject:@"four"];//删除不存在的对象时，什么情况都不会发生
        [array4 removeObjectAtIndex:0];
        NSLog(@"%@",array4);
//        [array4 removeObjectAtIndex:5];//删除指定下标的数组元素，当下标不存在时，程序会崩溃
//        NSLog(@"%@",array4);

        NSMutableArray *array5=[NSMutableArray arrayWithObjects:@"one",@"two",@"three",@"four",nil];
        NSRange r1={1,2};//1为要删除的数组元素开始的下标，2为从开始下标的连续2个元素
        [array5 removeObjectsInRange:r1];//删除指定范围的元素
        NSLog(@"%@",array5);
        NSMutableArray *array6=[NSMutableArray arrayWithObjects:@"one",@"two",@"three",@"four", nil];
        NSMutableArray *del=[NSMutableArray arrayWithObjects:@"two",@"four",nil];
        [array6 removeObjectsInArray:del];//删除指定数组中的所有元素，删除多个元素
        NSLog(@"%@",array6);
        [array6 removeAllObjects];//删除数组中的所有元素，即请空数组

    }
    return 0;
}
