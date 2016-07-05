//
//  ViewController.m
//  Demo2_图片查看器
//
//  Created by tarena on 15/10/29.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加捏合手势
    UIPinchGestureRecognizer *pinchGR=[[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
    //为了手势并存，需要设置手势的代理
    pinchGR.delegate=self;
    [self.view addGestureRecognizer:pinchGR];
    
    //添加旋转手势
    UIRotationGestureRecognizer *rotationGR=[[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotation:)];
    rotationGR.delegate=self;
    [self.view addGestureRecognizer:rotationGR];
    
    
    //添加拖拽手势
    UIPanGestureRecognizer *panGR=[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.view addGestureRecognizer:panGR];
    
    //添加一个支持双击的手势
    UITapGestureRecognizer *tapGR=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    
    tapGR.numberOfTapsRequired=2;
    [self.view addGestureRecognizer:tapGR];
    
}
//捏合手势实现图片的缩放变形
-(void)pinch:(UIPinchGestureRecognizer *)gr
{
//    self.imageView.transform=CGAffineTransformMakeScale(gr.scale, gr.scale);
    self.imageView.transform=CGAffineTransformScale(self.imageView.transform, gr.scale, gr.scale);
    //本次已经使用过了这个scale，为了下一次不在叠加这个比率，则将比率设置为1
    gr.scale=1;

}

//旋转手势实现旋转变形
-(void)rotation:(UIRotationGestureRecognizer *)gr
{
    self.imageView.transform=CGAffineTransformRotate(self.imageView.transform, gr.rotation);
    //使用完本次弧度后，将这一次的弧度归0
    gr.rotation=0;

}

//拖拽手势实现位移的变形
-(void)pan:(UIPanGestureRecognizer *)gr
{
    //手势移动到了某点
//    [gr locationInView:]
    
    //方式一：通过修改ImageView的center属性实现位移，因为center的值是参考self.view这个父视图坐标系，所以，distance也需要读取self.view这个坐标系下的值
    
    //    CGPoint distance=[gr translationInView:self.view];
    //
    //    CGPoint center=self.imageView.center;
    //    center.x+=distance.x;
    //    center.y+=distance.y;
    //    self.imageView.center=center;
    //
    // [gr setTranslation:CGPointZero inView:self.view];
   
    
    //方式二：通过修改ImageView的transform实现位移，但是，因为transform使用的是imageView坐标系下的值，所以distance也需要使用用imageView坐标系的值
    //手势移动了多少
    CGPoint distance=[gr translationInView:self.imageView];
    
    self.imageView.transform=CGAffineTransformTranslate(self.imageView.transform, distance.x, distance.y);
    
    [gr setTranslation:CGPointZero inView:self.imageView];
   
    

}
//两个手势允许同时识别
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;

}

-(void)tap:(UITapGestureRecognizer *)gr
{
//通过系统提供一个常量，将transform恢复
    self.imageView.transform=CGAffineTransformIdentity;
}


@end
