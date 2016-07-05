//
//  ViewController.m
//  Demo5_控制器中绘制圆形头像
//
//  Created by tarena on 15/10/28.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *ImageView;

@end

@implementation ViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    //重新绘制图片，生成圆形的内容，在显示到视图上
    [self creatCircleImage];
}

-(void)creatCircleImage
{
   //1.创建一张临时的空白画布（NO代表透明，YES代表不透明）
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(120, 120), NO, 0);
    
    //2.创建圆形所属的正方形
    UIBezierPath *path=[UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 120, 120)];
    [path addClip];
    
    //3.绘制图片
    UIImage *image=self.ImageView.image;
    [image drawInRect:CGRectMake(0, 0, 120, 120)];
    
    //4.将临时画布的内容保存成新的图片
    UIImage *newImage=UIGraphicsGetImageFromCurrentImageContext();
    
    //5.关闭临时绘画区间
    UIGraphicsEndImageContext();
    
    //6.显示新图到图片视图上
    self.ImageView.image=newImage;
    
}




@end
