//
//  MyViewController.m
//  Demo4_UILabelAndUIButton
//
//  Created by tarena on 15/10/9.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MyViewController.h"

//Extension 扩展
@interface MyViewController ()
//私有属性
@property(strong,nonatomic) UILabel *label;
@end

@implementation MyViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label=[[UILabel alloc] init];
    self.label=label;
    //显示的内容
    label.text=@"显示的内容很多很多很多多，一行显示不下来，要显示两行";
    //位置和大小
    //进行坐标计算，将label放在屏幕中间
    //1>获取屏幕的宽度
    CGFloat width=self.view.bounds.size.width;
    //2> 计算x的值
    CGFloat x=width*0.5-150;
    label.frame=CGRectMake(x, 40, 300, 200);
    //背景颜色
    label.backgroundColor=[UIColor lightGrayColor];
    //设置字体
    label.font=[UIFont italicSystemFontOfSize:30];
    //设置字体的颜色
    label.textColor=[UIColor redColor];
    //设置对齐方式
    label.textAlignment=NSTextAlignmentCenter;
    //文字的行数（最多显示多少行，默认是1行,0代表任意行）
    label.numberOfLines=0;
    
    [self.view addSubview:label];
    
    //二.UIButton的使用，当按下按钮后,执行一段代码
    UIButton *button=[UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"改变一下label的内容" forState:UIControlStateNormal];
     x=self.view.bounds.size.width*0.5-150;
    button.frame=CGRectMake(x, 260, 300, 40);
    button.backgroundColor=[UIColor grayColor];
    [self.view addSubview:button];
    
    
    //按钮后,执行一段代码
    /*三个参数
    *1.target:执行哪个对象的方法
    *2.action：执行哪个方法
    *3.events：当按钮触发了什么事件才执行target对象的action方法
     */
    [button addTarget:self action:@selector(buttonTap) forControlEvents:UIControlEventTouchUpInside];
}

-(void)buttonTap
{
    //NSLog(@"按钮被按了一下！");
    self.label.text=@"内容被改变了吧...";
}


@end
