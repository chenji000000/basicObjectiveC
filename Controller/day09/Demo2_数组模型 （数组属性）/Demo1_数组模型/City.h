//
//  City.h
//  Demo1_数组模型
//
//  Created by tarena on 15/10/19.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface City : NSObject
@property(nonatomic,strong) NSString *name;
@property(nonatomic) NSInteger population;
//用于存储子地区信息的数组属性
@property(nonatomic,strong) NSArray *subAreas;


//创建Demo数据
+(NSArray *)demoData;

@end
