//
//  PieChartItem.m
//  Demo02_饼图
//
//  Created by xiaoz on 15/9/22.
//  Copyright (c) 2015年 xiaoz. All rights reserved.
//

#import "PieChartItem.h"

@implementation PieChartItem

+ (NSArray *)demoData
{
    PieChartItem *item1 = [[PieChartItem alloc]init];
    item1.color = [UIColor redColor];
    item1.value = 0.27;
    
    PieChartItem *item2 = [[PieChartItem alloc]init];
    item2.color = [UIColor greenColor];
    item2.value = 0.29;

    PieChartItem *item3 = [[PieChartItem alloc]init];
    item3.color = [UIColor blueColor];
    item3.value = 0.14;

    PieChartItem *item4 = [[PieChartItem alloc]init];
    item4.color = [UIColor purpleColor];
    item4.value = 0.2;

    PieChartItem *item5 = [[PieChartItem alloc]init];
    item5.color = [UIColor yellowColor];
    item5.value = 0.1;

    return @[item1,item2,item3,item4,item5];
    
    
}




@end
