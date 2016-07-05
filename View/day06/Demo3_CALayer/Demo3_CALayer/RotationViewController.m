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
    
    self.play=NO;
    
    //创建一个放在视图中间的图片视图
    UIImageView *imageView=[[UIImageView alloc] init];
    self.imageView=imageView;
    imageView.image=[UIImage imageNamed:@"icon120"];imageView.layer.bounds=CGRectMake(0, 0, 280, 280);
    imageView.layer.position=CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2);
    imageView.layer.anchorPoint=CGPointMake(0.5, 0.5);
    
    imageView.layer.cornerRadius=140;
    imageView.layer.masksToBounds=YES;
    
    [self.view addSubview:imageView];
    
    //像图片中添加8个子层
    for (int i=0; i<8; i++) {
        CALayer *layer=[CALayer layer];
        layer.backgroundColor=[UIColor lightGrayColor].CGColor;
        layer.bounds=CGRectMake(0, 0, 20, self.imageView.bounds.size.width/2);
        layer.anchorPoint=CGPointMake(0.5, 1);
        layer.position=CGPointMake(self.imageView.bounds.size.width/2, self.imageView.bounds.size.height/2);
        layer.transform=CATransform3DMakeRotation(M_PI_4*i, 0, 0, 1);
        
        
        [self.imageView.layer addSublayer:layer];
    }
}

/*
 CADisplayLink定时器，只要创建了定时器，那么就会一秒钟调用某一个方法60次
 
 */

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{

    self.play=!self.play;
    //根据当前记录的是否播放状态来决定计时器是启动还是暂停
    self.link.paused=!self.play;

}
//此方法会在1秒钟内连续调用60次
-(void)rotation
{
    self.imageView.layer.transform=CATransform3DRotate(self.imageView.layer.transform, M_PI*2/180, 0, 0, 1);

}

//懒加载创建定时器
-(CADisplayLink *)link
{
    if (!_link) {
        _link=[CADisplayLink displayLinkWithTarget:self selector:@selector(rotation)];
        //手动将定时器加入到事件循环中
        [_link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    }
    return _link;
}

@end
