//
//  main.m
//  day08_7
//
//  Created by student on 15-9-28.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRStudent.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRStudent *stu1=[[TRStudent alloc] initWithName:@"zhangsan" andAge:18];
        TRStudent *stu2=[[TRStudent alloc] initWithName:@"lisi" andAge:19];
        TRStudent *stu3=[[TRStudent alloc] initWithName:@"wangwu" andAge:22];
        TRStudent *stu4=[[TRStudent alloc] initWithName:@"zhaoliu" andAge:20];
        TRStudent *stu5=[[TRStudent alloc] initWithName:@"qianqi" andAge:21];
        NSArray *stu=@[stu1,stu2,stu3,stu4,stu5];
        NSArray *sorted=[stu sortedArrayUsingSelector:@selector(compareName:)];
        NSLog(@"%@",sorted);
        
        NSArray *copiedStudent=[[NSArray alloc] initWithArray:stu copyItems:NO];//当第二个参数值为NO时，数组中的所有元素仅将引用计数加了一个1(引用计数加1，并没有申请存储空间)
        TRStudent *s=[copiedStudent objectAtIndex:0];
        s.age=30;
        TRStudent *s1=[stu objectAtIndex:0];
        NSLog(@"%@",s1);
        
        NSArray *copiedStudent1=[[NSArray alloc] initWithArray:stu copyItems:YES];//当第二个参数值为YES时，为深拷贝，即数组copiedStudent中的所有元素与数组stu中的所有元素各占各的存储空间
        NSLog(@"%@",copiedStudent1);
    }
    return 0;
}
