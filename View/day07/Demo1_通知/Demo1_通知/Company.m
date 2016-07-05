//
//  Company.m
//  Demo1_通知
//
//  Created by tarena on 15/11/4.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "Company.h"

@implementation Company

-(void)update
{
    //获取通知中心
    NSNotificationCenter *center=[NSNotificationCenter defaultCenter];
    //给中心发消息
    //name：发的通知的名字
    //object:谁给中心发的通知
    //userinfo：发送给中心的通知的内容是什么
    [center postNotificationName:@"UpdateNotification" object:self userInfo:@{@"title":@"还珠格格第八部",@"episode":@"第一集",}];

}
@end
