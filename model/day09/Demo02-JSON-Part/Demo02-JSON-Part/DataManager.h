//
//  DataManager.h
//  Demo02-JSON-Part
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataManager : NSObject

//给定数组（字典）类型，返回一个已经解析好的数组（模型对象）
+(NSArray *)deals:(NSDictionary *)dealDic;

@end
