//
//  TRUserInfo.m
//  day11_模拟系统的通讯录功能
//
//  Created by tarena on 15/10/8.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRUserInfo.h"

@implementation TRUserInfo
-(id)initWithName:(NSString *)name andEmail:(NSString *)email andTelephone:(NSString *)telephone
{
if(self=[super init])
{
    self.name=name;
    self.email=email;
    self.telephone=telephone;
}
    return self;
}
-(void)showInfo
{
    NSLog(@"name:%@,email:%@,telephone:%@",self.name,self.email,self.telephone);
}

@end
