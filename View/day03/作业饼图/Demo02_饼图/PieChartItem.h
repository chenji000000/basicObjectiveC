//
//  PieChartItem.h
//  Demo02_饼图
//
//  Created by xiaoz on 15/9/22.
//  Copyright (c) 2015年 xiaoz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PieChartItem : NSObject

@property(nonatomic,strong)UIColor *color;
@property(nonatomic,assign)CGFloat value;

+(NSArray *)demoData;

@end






