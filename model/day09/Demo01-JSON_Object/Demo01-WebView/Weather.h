//
//  Weather.h
//  Demo01-WebView
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Weather : NSObject

//只把需要解析出来的key声明属性
//经纬度
@property(nonatomic,strong)NSNumber *lon;
@property(nonatomic,strong)NSNumber *lat;
//天气描述(description关键字)
@property(nonatomic,strong)NSString *desc;
//日出时间(NSString为了显示方便)
@property(nonatomic,strong)NSString *sunrise;
//给定需要解析的参数，返回已经解析好的模型对象
+(id)weatherParseWithJSON:(NSDictionary *)jsonDic;

@end
