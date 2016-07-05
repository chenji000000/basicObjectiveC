//
//  MyViewController.m
//  Demo1_导航控制器
//
//  Created by tarena on 15/10/15.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MyViewController.h"
#import "OtherViewController.h"

@interface MyViewController ()

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //配置导航栏的右按钮
    
    UIBarButtonItem *item1=[[UIBarButtonItem alloc] initWithTitle:@"ok" style:UIBarButtonItemStylePlain target:self action:@selector(clickOK:)];
    
    UIBarButtonItem *item2=[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"down.png"] style:UIBarButtonItemStylePlain target:nil action:nil];
    
    self.navigationItem.rightBarButtonItems=@[item1,item2];
    
    //配置导航栏的左按钮
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:nil action:nil];
    
    //配置导航栏中间视图
    //创建按钮
    UIButton *button=[[UIButton alloc] init];
    [button setTitle:@"选择分组" forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"down.png"] forState:UIControlStateNormal];
    //设置按钮在selected时，图片为up
    //如果需要按钮从normal状态切换为selected状态
    //必须通过修改按钮的selected属性为YES才可以
    [button setImage:[UIImage imageNamed:@"up.png"] forState:UIControlStateSelected];
    
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    //添加事件
    [button addTarget:self action:@selector(clickTitleButton:) forControlEvents:UIControlEventTouchUpInside];
    button.frame=CGRectMake(0, 0, 200, 40);
    
//    button.backgroundColor=[UIColor redColor];
    
    
    
    //按钮添加到titleView中
    self.navigationItem.titleView=button;
    
    
    //设置工具条显示
    self.navigationController.toolbarHidden=NO;
    
    //设置工具条内容
    UIBarButtonItem *item3=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:nil action:nil];
    UIBarButtonItem *item4=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:nil action:nil];
    UIBarButtonItem *item5=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:nil action:nil];
    
    //创建木棍按钮
    UIBarButtonItem *itemFix=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    itemFix.width=40;
    
    //创建弹簧按钮
    UIBarButtonItem *itemFlexible=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    self.toolbarItems=@[itemFix,item5,itemFlexible,item3,itemFlexible,item4,itemFix];
}


-(void)clickTitleButton:(UIButton *) btn
{
    //通过修改selected属性，实现按钮切换到selected状态
    btn.selected=!btn.selected;
}



//点击导航的右按钮时，执行此方法，且参数代表着
//点击的那个item按钮
-(void)clickOK:(UIBarButtonItem *)item
{
    OtherViewController *otherVC=[[OtherViewController alloc] initWithNibName:@"OtherViewController" bundle:nil];
    
    //当推出新的VC时，隐藏要推出的VC底部的各种Bar
    otherVC.hidesBottomBarWhenPushed=YES;
    
    //推出otherVC
    [self.navigationController pushViewController:otherVC animated:YES];
}
@end
