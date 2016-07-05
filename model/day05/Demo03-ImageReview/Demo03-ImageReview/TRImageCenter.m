//
//  TRImageCenter.m
//  Demo03-ImageReview
//
//  Created by tarena on 15/11/10.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRImageCenter.h"

@implementation TRImageCenter

//使用GCD的方式创建单例对象
+(id)sharedImageCenter
{
    static TRImageCenter *imageCenter=nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
       //初始化
        imageCenter=[[TRImageCenter alloc] init];
    });
    return imageCenter;
}
//重写init方法来初始化可变字典

-(instancetype)init
{
    //初始化可变字典
    if (self=[super init]) {
        self.cachesMutableDic=[NSMutableDictionary dictionary];
    }
    return self;
}



@end
