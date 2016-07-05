//
//  NewsCell.h
//  Demo1_自定义单元格_改良版
//
//  Created by tarena on 15/10/20.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "News.h"

@interface NewsCell : UITableViewCell
//公开一个用于接收数据的属性即可，不要将内部的控件外露，数据到底怎么显示，是View自己的事情，不要由控制器来决定数据显示到那个位置
@property(nonatomic,strong) News *news;
@end
