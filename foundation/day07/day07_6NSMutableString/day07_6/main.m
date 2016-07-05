//
//  main.m
//  day07_6
//
//  Created by student on 15-9-24.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //字符串创建
        NSMutableString *str1=[[NSMutableString alloc] init];//创建一个空的字符串，它是有意义的，我们可以向其中添加内容
        
        NSMutableString *str2=@"abc";//str2会退化成不可变字符串NSString
        
        NSMutableString *str3=[NSMutableString stringWithCapacity:100];//预估值创建方法
        
        NSMutableString *str4=[NSMutableString stringWithString:@"string"];//标准创建方法
        
        NSMutableString *str5=[NSMutableString stringWithFormat:@"age %d",28];//标准格式化创建方法
        NSLog(@"%@",str5);
        
        //添加方法
        NSMutableString *str6=[NSMutableString stringWithString:@"The string"];
        [str6 appendString:@" has 6 characters"];//标准添加方法
        NSLog(@"%@",str6);
        NSMutableString *str7=[NSMutableString stringWithString:@"The string"];
        int num=6;
        [str7 appendFormat:@" has %d characters",num];//标准格式化添加方法
        NSLog(@"%@",str7);
        
        //删除方法
        NSMutableString *str8=[NSMutableString stringWithString:@"I am learning Objective-C language."];
        NSRange r=[str8 rangeOfString:@"Objective-"];//确定要删除的内容在原字符串中的范围
        [str8 deleteCharactersInRange:r];//根据范围删除指定的内容
        NSLog(@"%@",str8);
        
        //替换
        NSMutableString *str9=[NSMutableString stringWithString:@"This is a string"];
        NSRange r1=[str9 rangeOfString:@"a"];//替换第一个出现的a，若替换具体位子的字母，用{,};
        [str9 replaceCharactersInRange:r1 withString:@"another"];
        NSLog(@"%@",str9);
        


    }
    return 0;
}
