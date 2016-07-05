//
//  Message.m
//  我的微信
//
//  Created by tarena on 15/11/4.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "Message.h"

@implementation Message
+(NSArray *)demoData
{

    Message *m1=[[Message alloc] init];
    m1.content=@"hi,你好";
    m1.fromMe=YES;
    
    Message *m2=[[Message alloc] init];
    m2.content=@"干嘛？找我有事吗";
    m2.fromMe=NO;
    
    Message *m3=[[Message alloc] init];
    m3.content=@"今天有大新闻吗，和我聊一聊";
    m3.fromMe=YES;
    
    Message *m4=[[Message alloc] init];
    m4.content=@"我现在有事，待会再聊吧";
    m4.fromMe=NO;
    
    Message *m5=[[Message alloc] init];
    m5.content=@"就聊一下吧，我现在真的很无聊";
    m5.fromMe=YES;
    
    Message *m6=[[Message alloc] init];
    m6.content=@"真的不行呀，我下线了";
    m6.fromMe=NO;
    
    Message *m7=[[Message alloc] init];
    m7.content=@"拜拜拜。。。。";
    m7.fromMe=YES;
    
    return @[m1,m2,m3,m4,m5,m6,m7];
    
    
}

@end
