//
//  TRWeather.m
//  TRWeatherForcast
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "TRWeather.h"

@implementation TRWeather
+(id)weatherWithDailyDic:(NSDictionary *)dailyDic{
    return [[self alloc] initWithDailyDic:dailyDic];
}
-(id)initWithDailyDic:(NSDictionary *)dailyDic
{
    if (self=[super init]) {
        //iconURL
        NSString *iconStr=dailyDic[@"hourly"][0][@"weatherIconUrl"][0][@"value"];
        self.iconURL=[NSURL URLWithString:iconStr];
        //日期
        self.date=dailyDic[@"date"];
        //最低温度
        self.minTemp=dailyDic[@"mintempC"];
        //最高温度
        self.maxTemp=dailyDic[@"maxtempC"];
    }
    return self;
}

+(id)weatherWithHourlyDic:(NSDictionary *)hourlyDic{
    return [[self alloc] initWithHourlyDic:hourlyDic];
}
-(id)initWithHourlyDic:(NSDictionary *)hourlyDic
{
    if (self=[super init]) {
        //iconURL
        NSString *iconStr=hourlyDic[@"weatherIconUrl"][0][@"value"];
        self.iconURL=[NSURL URLWithString:iconStr];
        //时间
        int time=[hourlyDic[@"time"] intValue]/100;
        self.time=[NSString stringWithFormat:@"%d:00",time];
        //时间点的当前温度
        self.currentTemp=hourlyDic[@"tempC"];
       
    }
    return self;
}

@end
