//
//  Message.h
//  我的微信
//
//  Created by tarena on 15/11/4.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

//类型：聊天的消息类型，包括内容和谁发出的两部分属性
@interface Message : NSObject
@property(nonatomic,strong)NSString *content;
@property(nonatomic)BOOL fromMe;
+(NSArray *)demoData;

@end
