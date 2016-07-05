//
//  main.m
//  day07_5
//
//  Created by student on 15-9-24.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        char name[100];
        NSLog(@"请输入一个用户名");
        scanf("%s",name);
        NSString *strname=[NSString stringWithFormat:@"%s",name];
        NSLog(@"%@",strname);
        
        char code[100];
        NSLog(@"请输入一个密码");
        scanf("%s",code);
        NSString *strcode=[NSString stringWithCString:code encoding:NSASCIIStringEncoding];
        NSLog(@"%@",strcode);
        
        NSString *fileName=[NSString stringWithContentsOfFile:@"/Users/student/Desktop/wenjianming" encoding:NSUTF8StringEncoding error:nil];
        
    if([strname isEqualToString:fileName]==YES)
    {
        NSString *filecode=[NSString stringWithContentsOfFile: @"/Users/student/Desktop/mima" encoding:NSUTF8StringEncoding error:nil];
        if([strcode isEqualToString:filecode]==YES)
        {
            NSLog(@"登陆成功");
        }
        else
        {
            NSLog(@"用户名或密码错误");
        }
    }
        else
        {
            NSLog(@"用户名或密码错误");

        }
        
        
    }
    return 0;
}
