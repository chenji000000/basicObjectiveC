//
//  ViewController.m
//  Demo3_CALayer
//
//  Created by tarena on 15/11/3.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *grayView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.获取灰色View的layer对象
    CALayer *layer=self.grayView.layer;
    //设置层的背景色
    layer.backgroundColor=[UIColor redColor].CGColor;
    
    //设置边框宽度
    layer.borderWidth=5;
     //设置边框颜色
    layer.borderColor=[[UIColor blackColor] CGColor];
    
    //设置圆角
    layer.cornerRadius=20;
    
    //设置阴影的透明度，默认是0，透明，所以看不见，如果想看到阴影，一定要修改透明度
    layer.shadowOpacity=1;
    
    
    //设置阴影的颜色
    layer.shadowColor=[UIColor yellowColor].CGColor;
    //设置阴影的偏移量
    layer.shadowOffset=CGSizeMake(3, 3);
    
    //设置阴影的圆角
    layer.shadowRadius=30;
    
    //2.设置图片的圆角效果
    self.imageView.layer.cornerRadius=60;
    self.imageView.layer.masksToBounds=YES;
    self.imageView.layer.borderColor=[UIColor redColor].CGColor;
    self.imageView.layer.borderWidth=2;
    
    
    //3.CALayer具有容器的特性，可以互相嵌套，即一个层中可以再包含其他的层
    CALayer *myLayer=[CALayer layer];
    myLayer.backgroundColor=[UIColor purpleColor].CGColor;
//    myLayer.frame=CGRectMake(0, 0, 100, 100);
    
    //大小
    myLayer.bounds=CGRectMake(0, 0, 100, 100);
    //位置
    //将锚点所指定的点放在那里显示
    myLayer.position=CGPointMake(50, 50);
    //设置那个点为锚点，出现在position指定的位置
    myLayer.anchorPoint=CGPointMake(0, 0);
    
    //旋转myLayer,绕着锚点旋转
    myLayer.transform=CATransform3DMakeRotation(M_PI_4, 0, 0, 1);
    
    
    [self.view.layer addSublayer:myLayer];
//    [self.grayView.layer addSublayer:myLayer];
//    [self.imageView.layer addSublayer:myLayer];
    
    
    
    
}



@end