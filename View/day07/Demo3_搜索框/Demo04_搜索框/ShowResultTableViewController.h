//
//  ShowResultTableViewController.h
//  Demo04_搜索框
//
//  Created by xiaoz on 15/9/30.
//  Copyright (c) 2015年 xiaoz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowResultTableViewController : UITableViewController

//本控制器是被动使用的，所以要展示的数据来源
//就有使用者提供，所以需要公开一个数组，用于存储
//要展示的数据

@property(nonatomic,strong)NSArray *resultArray;


@end







