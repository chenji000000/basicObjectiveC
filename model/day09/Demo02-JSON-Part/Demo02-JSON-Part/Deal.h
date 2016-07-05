//
//  Deal.h
//  Demo02-JSON-Part
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Deal : NSObject

//dealID
@property(nonatomic,strong) NSString *dealID;
//title
@property(nonatomic,strong) NSString *title;
//优惠前的价格
@property(nonatomic,strong) NSNumber *listPrice;
//团购价格
@property(nonatomic,strong) NSNumber *currentPrice;
//给定某个团购订单数据，返回一个已经解析好的模型对象
+(id)parseDealWithJSON:(NSDictionary *) dealDic;

@end
