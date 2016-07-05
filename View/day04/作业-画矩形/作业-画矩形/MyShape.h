//
//  MyShape.h
//  作业-画矩形
//
//  Created by tarena on 15/10/30.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
//自定义的图形有两个能力
//1.记录自己的路径
//2.记录路径的状态(颜色 线宽)
@interface MyShape : NSObject

@property(nonatomic,strong)UIBezierPath *path;

@property(nonatomic,strong)UIColor *color;

@property(nonatomic)CGFloat  lineWidth;

@end







