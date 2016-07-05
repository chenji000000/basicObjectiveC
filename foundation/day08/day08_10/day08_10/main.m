//
//  main.m
//  day08_10
//
//  Created by student on 15-9-28.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //从控制台输入一个身份证号
        char id[20];
        NSLog(@"请输入身份证号：");
        scanf("%s",id);
        NSString *sid=[NSString stringWithCString:id encoding:NSASCIIStringEncoding];
        //得到身份证号中的年龄
        NSRange ryear={6,4};
        NSString *year=[sid substringWithRange:ryear];
        //得到当前日期
        NSDate *now3=[NSDate date];
        NSDateFormatter *format=[[NSDateFormatter alloc] init];
        format.dateFormat=@"yyyy";
        NSString *syear=[format stringFromDate:now3];
        //将相应的字符串类型转换成整型
        int iyear2=[year intValue];
        int syear2=[syear intValue];
        //计算年龄
        int age=syear2-iyear2;
        NSLog(@"身份证:%@,年龄:%d",sid,age);
    }
    return 0;
}
