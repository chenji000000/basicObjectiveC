//
//  Company.h
//  Demo1_通知
//
//  Created by tarena on 15/11/4.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
//company代表发送方
@interface Company : NSObject
//一调用此方法，代表给通知中心发剧集更新的通知
-(void)update;

@end
