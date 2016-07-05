//
//  TRTelephone.m
//  day11_模拟系统的通讯录功能
//
//  Created by tarena on 15/10/8.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRTelephone.h"

@implementation TRTelephone
-(void)list
{
if([self.userInfos count]==0)
{
    NSLog(@"你的联系人信息为空，无法查看！");
}
    else
    {
    for(NSString *userKey in self.userInfos)
    {
    //查看个人信息
        printf("==========\n");
        TRUserInfo* userInfo=[self.userInfos objectForKey:userKey];
        [userInfo showInfo];
        printf("==========\n");
    }
    }
}

//将用户信息保存到联系人信息中
-(void)addUserInfo:(TRUserInfo *)userInfo
{
    [self.userInfos setObject:userInfo forKey:userInfo.name];
}
-(id)initWithName:(NSString *)name
{
    if(self=[super init])
    {
        self.name=name;
        self.userInfos=[NSMutableDictionary dictionaryWithCapacity:100];
    }
    return self;
}

@end
