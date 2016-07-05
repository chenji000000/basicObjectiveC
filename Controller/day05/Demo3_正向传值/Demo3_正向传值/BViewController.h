//
//  BViewController.h
//  Demo3_正向传值
//
//  Created by tarena on 15/10/14.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BViewController : UIViewController
//公开一个属性，用于接收A传入的数值
@property(nonatomic,strong)NSString *str;


@end
