//
//  ViewController.m
//  Demo7_Tap手势
//
//  Created by tarena on 15/10/28.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *ImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.创建Tap手势对象
    UITapGestureRecognizer *tapGR=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    
    //2.设置Tap手势的常用属性
    //设置手势触发时，需要点击的次数
    tapGR.numberOfTapsRequired=2;
    
    //设置手势触发时，需要的触点数
    tapGR.numberOfTouchesRequired=1;
    
    //3.添加手势到某视图上
    [self.view addGestureRecognizer:tapGR];
    
    
}
//手势发生时，执行Tap方法，并且系统将发生的手势封装成对象，作为参数传入
-(void)tap:(UITapGestureRecognizer *)gr
{
    CGPoint point=[gr locationInView:self.ImageView];
    NSLog(@"%@",NSStringFromCGPoint(point));

}


@end
