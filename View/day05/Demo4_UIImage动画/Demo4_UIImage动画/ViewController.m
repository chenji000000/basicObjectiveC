//
//  ViewController.m
//  Demo4_UIImage动画
//
//  Created by tarena on 15/11/2.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //如果FPS为30，一秒钟30帧，则播完5张图片用多长时间？duration指的的是播完一遍所用的时间间隔
    UIImage *image=[UIImage animatedImageNamed:@"ship-anim" duration:1/30.0*5];
    self.imageView.image=image;
}



@end
