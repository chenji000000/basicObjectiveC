//
//  ViewController.m
//  Demo6_自定义原型下载视图
//
//  Created by tarena on 15/10/27.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import "downloadView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet downloadView *dView;
@property (weak, nonatomic) IBOutlet UISlider *slider;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dView.downloadValue=self.slider.value;
}

- (IBAction)chageValue:(UISlider *)sender {
    //只要有了新的下载数值，就赋值给dView
    self.dView.downloadValue=sender.value;
    //视图重绘视图
    [self.dView setNeedsDisplay];
}


@end
