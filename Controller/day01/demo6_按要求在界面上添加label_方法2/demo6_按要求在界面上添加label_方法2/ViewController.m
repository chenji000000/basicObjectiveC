//
//  ViewController.m
//  demo6_按要求在界面上添加label_方法2
//
//  Created by tarena on 15/10/9.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//记录label的text值
@property(nonatomic,copy) NSString* text;
//记录label的纵坐标
@property(nonatomic,assign) float y;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建一个按钮对象
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    //设置按钮的title,backgroundColor,font,frame等各项属性
    [btn setTitle:@"Kit me" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor lightGrayColor]];
    [btn setFrame:CGRectMake(20, 20, 280, 30)];
    [btn setFont:[UIFont systemFontOfSize:20]];
    
    //给按钮添加点击事件
    [btn addTarget:self action:@selector(addLabel) forControlEvents:UIControlEventTouchUpInside];
    //将按钮添加到界面中
    [self.view addSubview:btn];
    
    //初始化self.y和self.text的值，即第一个label对象的纵坐标位置和显示信息
    self.y=60.0f;
    self.text=@"hello";
    
}

-(void)addLabel
{
//每次点击都会创建一个新的UILabel对象
    UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(20, self.y, 280, 20)];
    //设置label的backgroundColor,text,textColor,font等各项属性
    [label setBackgroundColor:[UIColor redColor]];
    label.text=self.text;
    [label setTextColor:[UIColor yellowColor]];
    [label setFont:[UIFont systemFontOfSize:18]];
    [self.view addSubview:label];
    
    //每添加一个label对象，就更新self.y和self.text的值
    self.y+=30;
    self.text=[self.text stringByAppendingString:@"hello"];
}

@end
