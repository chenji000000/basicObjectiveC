//
//  main.m
//  day11_模拟系统的通讯录功能
//
//  Created by tarena on 15/10/8.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRTelephone.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //创建个人信息
        TRUserInfo *userInfo1=[[TRUserInfo alloc] initWithName:@"zhangsan" andEmail:@"zhangsan@163.com" andTelephone:@"13154326789"];
        TRUserInfo *userInfo2=[[TRUserInfo alloc] initWithName:@"lisi" andEmail:@"lisi@163.com" andTelephone:@"13876543219"];
        
        //创建通讯录
        TRTelephone *teleInfo=[[TRTelephone alloc] initWithName:@"ysy"];
        
        //将个人信息添加到联系人信息
        [teleInfo addUserInfo:userInfo1];
        [teleInfo addUserInfo:userInfo2];
        
        //查看所有联系人信息
        [teleInfo list];
    }
    return 0;
}
