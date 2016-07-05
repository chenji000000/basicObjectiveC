//
//  main.m
//  day09_2
//
//  Created by student on 15-9-29.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRStudent.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRStudent *stu1=[[TRStudent alloc] initWithName:@"zhangsan" andAge:18];
        TRStudent *stu2=[[TRStudent alloc] initWithName:@"lisi" andAge:19];
        TRStudent *stu3=[[TRStudent alloc] initWithName:@"wangwu" andAge:20];
        TRStudent *stu4=[[TRStudent alloc] initWithName:@"zhaoliu" andAge:21];
        TRStudent *stu5=[[TRStudent alloc] initWithName:@"qianqi" andAge:22];
        
        NSMutableArray *stu=[NSMutableArray arrayWithObjects:stu1,stu2,stu3,stu4,stu5,nil];
       
        for(int i=0;i<[stu count];i++)
        {
            NSLog(@"%@",stu);
        }
    }
    return 0;
}
