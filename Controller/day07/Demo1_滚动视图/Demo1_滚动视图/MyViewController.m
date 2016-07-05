//
//  MyViewController.m
//  Demo1_滚动视图
//
//  Created by tarena on 15/10/16.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()
@property(nonatomic,strong) UIScrollView *sv;
@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //配置导航栏右侧的按钮
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"move" style:UIBarButtonItemStylePlain target:self action:@selector(move:)];
    
    //1.创建滚动视图
     UIScrollView *sv=[[UIScrollView alloc] init];
    self.sv=sv;
    //2设置滚动视图的可见区域大小
    //bounds也是CGRect类型的结构体
    //默认，bounds中的origin（x,y）永远是0，0
    //bounds中的size代表的就是视图的大小
   // sv.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    //此句为设置滚动视图与控制器的view一样大
    sv.frame=self.view.bounds;
    
    //3.设置滚动视图的子视图
    UIImageView *imageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Elephant.jpg"] ];
    [sv addSubview:imageView];
    //4.设置滚动视图中的内容的大小
    sv.contentSize=imageView.bounds.size;
    //5.将滚动视图添加到控制器的view中
    [self.view addSubview:sv];
    
    
}
//点击导航栏右侧按钮时，滚动视图移动到显示象牙
-(void)move:(UIBarButtonItem *)item
{
//修改滚动视图的contentOffset属性
    //设置偏移量
//    self.sv.contentOffset=CGPointMake(2800, 1600);
    [self.sv setContentOffset:CGPointMake(2800, 1600) animated:YES];

}

@end
