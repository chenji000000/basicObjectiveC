//
//  MyRect.h
//  Demo05_触控
//
//  Created by xiaoz on 15/9/22.
//  Copyright (c) 2015年 xiaoz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//自定义的矩形对象
//两个能力：
//1.记录矩形的大小（路径）
//2.记录矩形的长相（线条粗细、线条的颜色）
@interface MyRect : NSObject

@property(nonatomic,strong)UIBezierPath *path;

@property(nonatomic,assign)CGFloat borderWidth;

@property(nonatomic,strong)UIColor *borderColor;

@end







