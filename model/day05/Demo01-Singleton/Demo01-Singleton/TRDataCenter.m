//
//  TRDataCenter.m
//  Demo01-Singleton
//
//  Created by tarena on 15/11/10.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRDataCenter.h"

@implementation TRDataCenter
//回顾
static TRDataCenter *_dataCenter=nil;
+(id)sharedDataCenterByUnsafe{
    if (_dataCenter==nil) {
        _dataCenter=[[TRDataCenter alloc] init];
    }
    return _dataCenter;
}

+(id)sharedDataCenterBySafe{
    //1.声明一个空的静态的单例对象
    static TRDataCenter *sharedDataCenter=nil;
    //2.声明一个静态的GCD单次任务对象
    static dispatch_once_t onceToken;
    //3.执行GCD的单次任务，对对象进行初始化
    dispatch_once(&onceToken, ^{
        //初始化
        sharedDataCenter=[[TRDataCenter alloc] init];
    });
    return sharedDataCenter;
}

static TRDataCenter *_dataCenterInit=nil;
//重写initialize方法
+(void)initialize{
    if (self==[TRDataCenter class]) {
        //初始化操作
        _dataCenterInit=[[TRDataCenter alloc] init];
    }
}

+(id)sharedDataCenterByInitialize
{
    return _dataCenterInit;
}

@end
