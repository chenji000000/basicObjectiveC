//
//  main.m
//  day08_3
//
//  Created by student on 15-9-28.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        char ID[100];
        NSLog(@"输入身份证号");
        scanf("%s",ID);
        
        NSString *strID=[NSString stringWithFormat:@"%s",ID];
        NSRange r={6,4};
        NSString *year=[strID substringWithRange:r];
        
        //获取当前时间年
        NSDate *now=[NSDate date];
        NSDateFormatter *f=[[NSDateFormatter alloc] init];
        f.dateFormat=@"yyyy";
        NSString *syear=[f stringFromDate:now];
        
        int iyear=[year intValue];//方法intValue将字符串year转换成整型数字
        int syear2=[syear intValue];
        int age=syear2-iyear;
        NSLog(@"年龄为%d",age);
        
    }
    return 0;
}
