//
//  TRTelephone.h
//  day11_模拟系统的通讯录功能
//
//  Created by tarena on 15/10/8.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRUserInfo.h"

@interface TRTelephone : NSObject

//区分不同的电话卡
@property(nonatomic,copy) NSString* name;
//所有人联系信息
@property(nonatomic,retain) NSMutableDictionary* userInfos;

-(id)initWithName:(NSString*)name;
//向联系人信息对象，添加个人信息
-(void)addUserInfo:(TRUserInfo*)userInfo;
//查看所有联系人信息
-(void)list;

@end
