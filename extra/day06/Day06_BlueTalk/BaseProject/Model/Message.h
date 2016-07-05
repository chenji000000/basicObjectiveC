//
//  Message.h
//  BaseProject
//
//  Created by tarena on 15/12/19.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Message : NSObject

/** 消息内容 */
@property (nonatomic, strong) NSString *content;
/** 收 还是 发 */
@property (nonatomic) BOOL fromMe;
@end
