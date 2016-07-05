//
//  VIP.m
//  Demo1_通知
//
//  Created by tarena on 15/11/4.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "VIP.h"
//VIP代表接收方，但是能接收的前提是提前根据通知的名称向通知中心订阅此通知。重点：有订阅一定要在订阅者消失时取消订阅的通知
@implementation VIP

-(instancetype)init
{
    if (self=[super init]) {
        //向通知中心订阅名字叫updateNotification的通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNewMessage:) name:@"UpdateNotification" object:nil];
    }
    return self;
}

//用于接收到通知时，自动响应的方法
-(void)receiveNewMessage:(NSNotification *) notification
{

    NSDictionary *dict=notification.userInfo;
    NSLog(@"%@已经更新到%@",dict[@"title"],dict[@"episode"]);

}


//将注册过的通知取消掉
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];

}

@end
