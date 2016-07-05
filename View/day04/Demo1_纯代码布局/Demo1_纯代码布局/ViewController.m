//
//  ViewController.m
//  Demo1_纯代码布局
//
//  Created by tarena on 15/10/30.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *button;

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
}
//此方法在程序运行时，及屏幕旋转时，被系统自动调用，对于控制器直接管理的视图的布局代码就写在此方法中
-(void)viewDidLayoutSubviews
{
   
    CGRect frame=self.button.frame;
    frame.origin.x=self.view.bounds.size.width-frame.size.width-20;
    frame.origin.y=20;
    self.button.frame=frame;
    
    frame=self.label.frame;
    frame.origin.x=self.view.bounds.size.width-frame.size.width-20;
    frame.origin.y=self.view.bounds.size.height-frame.size.height-20;
    self.label.frame=frame;
}

@end
