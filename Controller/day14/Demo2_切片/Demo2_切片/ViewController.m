//
//  ViewController.m
//  Demo2_切片
//
//  Created by tarena on 15/10/26.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISlider *volumeSlider;
@property (weak, nonatomic) IBOutlet UIImageView *popImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置slider右边的背景图
    [self.volumeSlider setMaximumTrackImage:[UIImage imageNamed:@"playing_volumn_slide_foreground"]  forState:UIControlStateNormal];
    //设置slider左边的背景图
    [self.volumeSlider setMinimumTrackImage:[UIImage imageNamed:@"playing_volumn_slide_bg"] forState:UIControlStateNormal];
    //设置slider中间的圆球的背景图
    [self.volumeSlider setThumbImage:[UIImage imageNamed:@"playing_volumn_slide_sound_icon"] forState:UIControlStateNormal];
    
    //设置尾巴朝左的灰色气泡
    
    UIImage *popImage=[[UIImage imageNamed:@"message_other"] resizableImageWithCapInsets:UIEdgeInsetsMake(14, 28, 14, 14) resizingMode:UIImageResizingModeStretch];

    
    self.popImageView.image=popImage;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
