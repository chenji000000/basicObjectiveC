//
//  TRWeather.h
//  TRWeatherForcast
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRWeather : NSObject
//城市名字
@property (nonatomic, strong) NSString *cityName;
//天气图标URL
@property (nonatomic, strong) NSURL *iconURL;
//天气情况描述
@property (nonatomic, strong) NSString *weatherDesc;
//当前天气温度
@property (nonatomic, strong) NSString *currentTemp;
//最低温度
@property (nonatomic, strong) NSString *minTemp;
//最高温度
@property (nonatomic, strong) NSString *maxTemp;
//时间（小时界面）
@property (nonatomic, strong) NSString *time;
//日期（天界面）
@property (nonatomic, strong) NSString *date;

//提供接口（给定参数，返回一个已经解析好的模型对象）
//每天数据(解析/NSDictionary——>TRWeather)
+(id)weatherWithDailyDic:(NSDictionary *)dailyDic;
//每小时数据
+(id)weatherWithHourlyDic:(NSDictionary *)hourlyDic;
+(id)weatherWithHeaderViewDic:(NSDictionary *)jsonDic;
@end
