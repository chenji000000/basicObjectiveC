//
//  CodeViewController.m
//  Demo3_图片视图
//
//  Created by tarena on 15/10/15.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "CodeViewController.h"

@interface CodeViewController ()


@end

@implementation CodeViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self testImageView2];
}

-(void)testImageView1
{
    // 1.创建图片视图实例
    UIImageView *iv = [[UIImageView alloc]init];
    
    // 2.设置视图的大小及位置
    iv.frame = CGRectMake(50,100,250,400);
    
    // 3.设置图片视图内要显示的图片
    iv.image = [UIImage imageNamed:@"fbb01.jpg"];
    
    // 4.设置图片内容的显示模式
    iv.contentMode = UIViewContentModeScaleToFill;
    
    iv.backgroundColor = [UIColor lightGrayColor];
    
    // 5.将图片视图添加到控制器的view中
    [self.view addSubview:iv];
}

-(void)testImageView2
{
    // 创建imageView的同时就指定了图片
    // 那么图片视图会与图片保持一样大
    // 所以添加到控制器的view中时,从屏幕的左顶点开始显示
    UIImageView *iv = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"fbb01.jpg"]];
    
    //iv.frame = CGRectMake(40, 50, 260, 400);
    
    [self.view addSubview:iv];
}






@end
