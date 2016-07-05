//
//  PopView.h
//  Demo3_绘制右侧的气泡
//
//  Created by tarena on 15/10/28.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopView : UIView
//公开一个属性用于存储聊天的内容
//视图的drawRect方法就可以根据message内容的多少决定气泡的位置和大小
@property(nonatomic,strong)NSString *message;

@end
