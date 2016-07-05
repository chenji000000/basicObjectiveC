//
//  BViewController.h
//  Demo4_反向传值
//
//  Created by tarena on 15/10/14.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AViewController.h"

@interface BViewController : UIViewController
//为了能够让bvc访问到A控制器，所以公开一个属性
//来存储A的属性
//此处B不能再强引用A了
//因为A推出B，A创建了B，A已经强引用了B
//所以，如果B在反过来强引用A的话
//就形成了循环引用，有可能引起内存泄露
//所以要将这个关系变为弱引用
@property(nonatomic,weak) AViewController *backReference;

@end
