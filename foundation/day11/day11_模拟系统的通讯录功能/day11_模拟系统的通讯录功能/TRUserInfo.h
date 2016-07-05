//
//  TRUserInfo.h
//  day11_模拟系统的通讯录功能
//
//  Created by tarena on 15/10/8.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRUserInfo : NSObject
@property(nonatomic,copy) NSString* name;
@property(nonatomic,copy) NSString* email;
@property(nonatomic,copy) NSString* telephone;
-(id)initWithName:(NSString*)name andEmail:(NSString*)email andTelephone:(NSString*)telephone;
-(void)showInfo;

@end
