//
//  RotationViewController.m
//  Demo3_CALayer
//
//  Created by tarena on 15/11/3.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "RotationViewController.h"

@interface RotationViewController ()
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)CADisplayLink *link;

//记录是否正在播放
@property(nonatomic)BOOL play;

@end

@implementation RotationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.play = NO;
    
    // 创建一个放在视图中间的图片视图
    UIImageView *imageView = [[UIImageView alloc]init];
    self.imageView = imageView;
    imageView.image = [UIImage imageNamed:@"icon152"];
    imageView.layer.bounds = CGRectMake(0, 0, 280, 280);
    imageView.layer.position = CGPointMake(self.view.bounds.size.width*0.5, self.view.bounds.size.height*0.5);
    imageView.layer.anchorPoint = CGPointMake(0.5, 0.5);
    imageView.layer.cornerRadius = 140;
    imageView.layer.masksToBounds = YES;
    
    [self.view addSubview:imageView];
    
    imageView.userInteractionEnabled = YES;
    
    //向图片中添加8个子层
    for (int i=0; i<8; i++)
    {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        [btn setTitle:@"星座" forState:UIControlStateNormal];
        CALayer *layer = btn.layer;
        layer.backgroundColor = [UIColor grayColor].CGColor;
        layer.bounds = CGRectMake(0, 0, 50, self.imageView.bounds.size.width*0.5);
        layer.anchorPoint = CGPointMake(0.5, 1);
        layer.position = CGPointMake(self.imageView.bounds.size.width*0.5, self.imageView.bounds.size.height*0.5);
        layer.transform = CATransform3DMakeRotation(i*M_PI_4, 0, 0, 1);
        
        [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = i+1;
        
        [self.imageView addSubview:btn];
    }
}

- (void)clickBtn:(UIButton *)btn
{
    NSLog(@"%ld",btn.tag);
}



/*
CADisplayLink定时器,只要创建了定时器,那么就会
 一秒钟调用某一个方法60次
*/
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.play = !self.play;
    // 根据当前记录的是否播放状态来决定计时器是启动还是暂停
    self.link.paused = !self.play;
    
}
//此方法会在1秒钟内连续调用60次
-(void)rotation
{
    self.imageView.layer.transform = CATransform3DRotate(self.imageView.layer.transform, 2*M_PI/180, 0, 0, 1);
}

//懒加载创建定时器
- (CADisplayLink *)link
{
    if (!_link) {
        _link = [CADisplayLink displayLinkWithTarget:self selector:@selector(rotation)];
        //手动将定时器加入到事件循环中
        [_link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    }
    return _link;
}



@end
