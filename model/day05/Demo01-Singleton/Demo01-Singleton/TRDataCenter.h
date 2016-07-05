//
//  TRDataCenter.h
//  Demo01-Singleton
//
//  Created by tarena on 15/11/10.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRDataCenter : NSObject

//API（Application Program Interface）
//线程不安全创建单例方法
+(id)sharedDataCenterByUnsafe;

//线程安全创建单例方法
+(id)sharedDataCenterBySafe;

//initialize方式创建单例对象（线程安全——>了解）
+(id)sharedDataCenterByInitialize;
@end
