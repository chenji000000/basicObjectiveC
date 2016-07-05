//
//  ViewController.m
//  Demo1_变形
//
//  Created by tarena on 15/10/29.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *ImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
//实现位移的变形效果
- (IBAction)Translation:(id)sender {
//有make的函数是基于没有变形之前的状态计算一个数值
    self.ImageView.transform=CGAffineTransformMakeTranslation(20, 20);
    //没有make的函数是基于传入的transform属性的当前状态进行计算，得到一个数值，所以，效果就会累加
    self.ImageView.transform=CGAffineTransformTranslate(self.ImageView.transform, 20, 20);
    
    
}
//实现缩放的变形效果
- (IBAction)Scale:(id)sender {
//    self.ImageView.transform=CGAffineTransformMakeScale(1.1, 1.1);
    self.ImageView.transform=CGAffineTransformScale(self.ImageView.transform, 1.1, 1.1);
    
    
}
//实现旋转的变形效果
- (IBAction)Rotation:(id)sender {
//    self.ImageView.transform=CGAffineTransformMakeRotation(M_PI_4);
    self.ImageView.transform=CGAffineTransformRotate(self.ImageView.transform, M_PI_4);
    
    
}


@end
