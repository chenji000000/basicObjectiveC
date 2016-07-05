//
//  CJTabBarController.m
//  我的微信
//
//  Created by tarena on 15/10/27.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "CJTabBarController.h"

@interface CJTabBarController ()

@end

@implementation CJTabBarController

+(void)initialize
{
    if (self==[CJTabBarController class]) {
        UITabBar *tabBar=[UITabBar appearance];
        //1.设置tabBar的背景
        [tabBar setBackgroundImage:[UIImage imageNamed:@"toolbarBkg_white"]];
        //2.设置tabBar中某个项被选中时的背景图
//        [tabBar setSelectionIndicatorImage:[UIImage imageNamed:@"tabbar_selected_back"]];
        
        //3.获取tabBarItem的外观实例
        UITabBarItem *barItem=[UITabBarItem appearance];
        //barItem中文字的位置偏移量
        [barItem setTitlePositionAdjustment:UIOffsetMake(0, -1)];
        
        NSMutableDictionary *selectedAttributes=[NSMutableDictionary dictionary];
        
        selectedAttributes[NSForegroundColorAttributeName]=[UIColor colorWithRed:26/255.0 green:178/255.0 blue:10/255.0 alpha:1];
        
        selectedAttributes[NSFontAttributeName]=[UIFont systemFontOfSize:11];
        
        [barItem setTitleTextAttributes:selectedAttributes forState:UIControlStateSelected];
        
        //设置Item没有被选中时的字体颜色
        NSMutableDictionary *normalAttributes=[NSMutableDictionary dictionary];
        normalAttributes[NSForegroundColorAttributeName]=[UIColor colorWithRed:103/255.0 green:103/255.0 blue:103/255.0 alpha:1.0];
        normalAttributes[NSFontAttributeName]=[UIFont systemFontOfSize:14];
        [barItem setTitleTextAttributes:normalAttributes forState:UIControlStateNormal];
    }

}

@end
