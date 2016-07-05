//
//  ViewController.m
//  Demo5_Tom猫
//
//  Created by tarena on 15/11/2.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *TomImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}
- (IBAction)start:(id)sender {
    //将动画所需的所有图片存到数组中
    NSMutableArray *allImages=[NSMutableArray array];
    for (int i=0; i<81; i++) {
        NSString *imageName=[NSString stringWithFormat:@"knockout_%02d.jpg",i];
        //使用imageName创建的UIImage对象不会随着Image使用完而销毁，系统会自动缓存该图片对象
//        UIImage *image=[UIImage imageNamed:imageName];
        
        //通过传入图片的绝对路径来创建的image用完后会销毁
        //pathForResource方法用于根据资源名返回该资源的绝对路径
        NSString *filePath=[[NSBundle mainBundle] pathForResource:imageName ofType:nil];
        
        UIImage *image=[UIImage imageWithContentsOfFile:filePath];
        
        [allImages addObject:image];
    }
    
    
    //animationImages属性用于存储所有动画中涉及到的每一帧图片对象，所以该数组中存储的就是多个UIImage对象
//    self.TomImageView.animationImages=allImages;
    [self.TomImageView setAnimationImages:allImages];
    self.TomImageView.animationRepeatCount=1;
    self.TomImageView.animationDuration=allImages.count*0.075;
    [self.TomImageView startAnimating];
    
    //当动画结束时将动画所需的数组数据移调，即不再使用数组，于是数组被释放
    [self.TomImageView performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:self.TomImageView.animationDuration];
}


@end
