//
//  User.h
//  Demo3_静态表格
//
//  Created by tarena on 15/10/20.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
@property(nonatomic,strong) NSString *wechatNum;
@property(nonatomic,strong) NSString *qqNum;
@property(nonatomic,strong) NSString *telNum;
@property(nonatomic,strong) NSString *email;
@property(nonatomic,getter=isProtect)BOOL protect;
@end
