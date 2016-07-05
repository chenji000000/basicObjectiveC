//
//  RectPainting.h
//  Demo05_触控
//
//  Created by xiaoz on 15/9/22.
//  Copyright (c) 2015年 xiaoz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RectPainting : UIView

//接收外界传入的绘制本次图形的颜色和线条粗细
@property(nonatomic,strong)UIColor *currentLineColor;
@property(nonatomic,assign)CGFloat currentLineWidth;

@end







