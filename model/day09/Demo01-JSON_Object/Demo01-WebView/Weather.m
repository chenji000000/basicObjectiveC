//
//  Weather.m
//  Demo01-WebView
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "Weather.h"

@implementation Weather

+(id)weatherParseWithJSON:(NSDictionary *)jsonDic
{
    return [[self alloc] initWithJSON:jsonDic];

}

-(id)initWithJSON:(NSDictionary *)jsonDic{
    if (self=[super init]) {
        //经纬度
        self.lon=jsonDic[@"coord"][@"lon"];
        self.lat=jsonDic[@"coord"][@"lat"];
        //天气描述
        self.desc=jsonDic[@"weather"][0][@"description"];
        //日出时间
        NSNumber *sunrise=jsonDic[@"sys"][@"sunrise"];
        NSDate *date=[NSDate dateWithTimeIntervalSince1970:[sunrise doubleValue]];
        NSDateFormatter *formatter=[NSDateFormatter new];
        [formatter setDateFormat:@"hh:mm:ss"];
        self.sunrise=[formatter stringFromDate:date];
    }
    return self;
}


@end
