//
//  downloadView.h
//  Demo6_自定义原型下载视图
//
//  Created by tarena on 15/10/27.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface downloadView : UIView

//公开一个属性，用于记录外界传入的当前进度数值
@property(nonatomic)CGFloat downloadValue;

//公开一个属性，用于记录外界传入的圆弧的颜色
@property(nonatomic,strong)UIColor *downloadColor;

@end
