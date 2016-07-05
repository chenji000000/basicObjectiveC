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
        self.currentTemp=[NSString stringWithFormat:@"%@˚",hourlyDic[@"tempC"]];
       
    }
    return self;
}

+(id)weatherWithHeaderViewDic:(NSDictionary *)jsonDic{
    return [[self alloc] initWithJsonDic:jsonDic];
}

-(id)initWithJsonDic:(NSDictionary *)jsonDic
{
    if (self=[super init]) {
        //城市
        self.cityName=jsonDic[@"data"][@"request"][0][@"query"];
        //天气情况描述
        self.weatherDesc=jsonDic[@"data"][@"current_condition"][0][@"weatherDesc"][0][@"value"];
        //当天温度
        self.currentTemp=[NSString stringWithFormat:@"%@˚",jsonDic[@"data"][@"current_condition"][0][@"temp_C"]];
        //最低温度
        self.minTemp=jsonDic[@"data"][@"weather"][0][@"mintempC"];
        //最高温度
        self.maxTemp=jsonDic[@"data"][@"weather"][0][@"maxtempC"];
        //天气图标URL
        NSString *iconStr=jsonDic[@"data"][@"current_condition"][0][@"weatherIconUrl"][0][@"value"];
        self.iconURL=[NSURL URLWithString:iconStr];
    }
    return self;
}


@end
