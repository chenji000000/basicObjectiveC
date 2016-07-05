//
//  AViewController.h
//  Demo4_反向传值
//
//  Created by tarena on 15/10/14.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AViewController : UIViewController
//为了接收B回传回来的数据，公开一个属性
@property(nonatomic,strong) NSString *backValue;

@end
