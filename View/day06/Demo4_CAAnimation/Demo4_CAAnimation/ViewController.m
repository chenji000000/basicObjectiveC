//
//  ViewController.m
//  Demo4_CAAnimation
//
//  Created by tarena on 15/11/3.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
//    [self testPosition];
//    [self testTransform];
    [self testKeyframeAnimation];

}
//1.测试位移动画
-(void)testPosition
{
    CABasicAnimation *anim=[CABasicAnimation animation];
    //一个重要的设置：就是keyPath
    //位移动画一定要设置为position，不能写错
    anim.keyPath=@"position";
    //设置动画结束时的位置信息
    //将结构体CGPoint封装成NSValue对象类型
    anim.toValue=[NSValue valueWithCGPoint:CGPointMake(350, 350)];
//设置动画时长
    anim.duration=2;
    //重复次数
    anim.repeatCount=4;
    
    //以下两句可以设置动画结束时，Layer停在toValue这里
    anim.removedOnCompletion=NO;
    anim.fillMode=kCAFillModeForwards;
    
    //添加动画到层上
    [self.imageView.layer addAnimation:anim forKey:nil];

}

//2.测试与变形有关的动画效果
-(void)testTransform
{
    CABasicAnimation *anim=[CABasicAnimation animation];
    anim.keyPath=@"transform.rotation";
    anim.toValue=@(M_PI*2);
    anim.duration=1;
    anim.repeatCount=MAXFLOAT;
    [self.imageView.layer addAnimation:anim forKey:nil];
}

//3.测试关键帧动画
-(void)testKeyframeAnimation
{
    CAKeyframeAnimation *anim=[CAKeyframeAnimation animation];
    //设置keyPath为position，代表实现位移动画
    //keyPath为了配合KVC赋值所用的属性名
    anim.keyPath=@"position";
    //path是动画位移过程中的距离路径
    anim.path=[UIBezierPath bezierPathWithRoundedRect:CGRectMake(50, 50, 200, 200) cornerRadius:10].CGPath;
    anim.duration=3;
    
    //以下两句可以设置动画结束时，Layer停在toValue这里
    anim.removedOnCompletion=NO;
    anim.fillMode=kCAFillModeForwards;
    
    [self.imageView.layer addAnimation:anim forKey:nil];
    

}

@end
