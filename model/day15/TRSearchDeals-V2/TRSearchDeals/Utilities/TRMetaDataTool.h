//
//  TRMetaDataTool.h
//  TRSearchDeals
//
//  Created by tarena on 15/11/20.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRMetaDataTool : NSObject

//返回所有分类的方法（数组：TRCategories）
+ (NSArray *)categories;

//返回所有排序的方法（数组：TRSort）
+ (NSArray *)sorts;

//返回所有城市的方法（数组：TRCity）
+ (NSArray *)cities;

+ (NSArray *)regionsByCityName:(NSString *)cityName;

@end
