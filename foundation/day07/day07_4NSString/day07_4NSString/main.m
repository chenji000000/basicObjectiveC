//
//  main.m
//  day07_4NSString
//
//  Created by student on 15-9-24.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //创建字符串
        NSString *str=[[NSString alloc] init];
        NSString *str1=@"Hello";
        NSString *str2=@"Hello";//如果字符串已经存在，则不会创建新的字符串
        NSString *str3=[NSString stringWithFormat:@"%@ World!",str1];//使用指定格式创建新的字符串
        NSLog(@"%@",str3);
        
        int age=28;
        NSString *str4=[NSString stringWithFormat:@"He is %d old",age];
        NSLog(@"%@",str4);
        
        NSString *str5=[NSString stringWithFormat:@"He is %d old",age];//使用格式方式创建字符串时，即使完全相同，也不会是一个字符串（即使完全相同，也是完全不同的字符串）
        
        //字符串的分割
        NSString *str6=@"www.tarena.com.cn";
        //截取头
        NSString *str7=[str6 substringToIndex:3];//截取str6的前3个字符
        NSLog(@"%@",str7);
        //截取尾
        NSString *str8=[str6 substringFromIndex:14];//截取str6中从第14个字符开始到字符串结尾的字符
        NSLog(@"%@",str8);
        //截取中段
        NSRange r={4,6};//确定截取的范围，从str6的第4个字符开始，连续6个字符
        NSString *str9=[str6 substringWithRange:r];
        NSLog(@"%@",str9);
        
        NSString *str10=@"This is a string";

        NSLog(@"%@",[str10 substringToIndex:4]);
        
        NSLog(@"%@",[str10 substringFromIndex:10]);
        
        NSRange r1={6,3};
        NSLog(@"%@",[str10 substringWithRange:r1]);
        
        //字符串的拼接
        NSString *str11=@"www.tarena";
        NSString *str12=@".com.cn";
        NSString *str13=[[NSString alloc] initWithFormat:@"%@%@",str11,str12];//用格式初始化方法进行拼接
        NSLog(@"%@",str13);
        
        NSString *str14=[str11 stringByAppendingString:str12];//用追加的方式进行拼接
        NSLog(@"%@",str14);
        
        NSString *str15=[str11 stringByAppendingFormat:@"%@",str12];//用格式化追加方式进行拼接
        NSLog(@"%@",str15);
       
        //字符串的替换
        NSString *str16=@"www.tarena.com.cn";
        NSRange r2={3,1};//指定替换的范围，将str16中第3个字符开始的连续1个字符进行替换
        NSString *str17=[str16 stringByReplacingCharactersInRange:r2 withString:@"@"];
        NSLog(@"%@",str17);
        
        //从文件中创建字符串
        NSString *str18=[NSString stringWithContentsOfFile:@"/Users/student/Desktop/testString" encoding:NSUTF8StringEncoding error:nil];
        NSLog(@"%@",str18);
    }
    return 0;
}
