//
//  MyViewController.m
//  Demo4_滚动视图
//
//  Created by tarena on 15/10/15.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.创建ScrollView实例
    UIScrollView *sv=[[UIScrollView alloc] init];
    
    //2.设置滚动视图的frame
    sv.frame=CGRectMake(30, 40, 250, 400);
    
    //3.向滚动视图中添加一个图片子视图
    UIImageView *iv=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Elephant.jpg"]];
    
    [sv addSubview:iv];
    
    //设置滚动视图内承载的内容的尺寸大小
    //有了大小，系统就知道滚动到哪里再停下来
    sv.contentSize=iv.frame.size;
    
    //4.将滚动视图添加到控制器的view中
    [self.view addSubview:sv];
    
    
    
    
    
}

@end
