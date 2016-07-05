//
//  BViewController.h
//  Demo5_反向传值_代理模式
//
//  Created by tarena on 15/10/14.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
//声明，意在告诉系统，名字叫BViewController仅仅只是一个类名，不要不认识就好
@class BViewController;

//1.定义一个协议，用于约束代理方
//通过提前定义好一个方法名，一次告诉代理方法要发的消息名称是什么
//定义协议的规则：
//a.协议名： 委托方+Delegate
//b.方法名要尽量体现发消息的时机
//c.方法的第一个参数一定是委托方自己
@protocol BViewControllerDelegate <NSObject>

-(void)bViewController:(BViewController *)bvc didFinishInput:(NSString *)str;

@end

@interface BViewController : UIViewController

//2.公开一个属性，用于记录代理方对象的引用
@property(nonatomic,weak) id<BViewControllerDelegate> delegate;

@end

