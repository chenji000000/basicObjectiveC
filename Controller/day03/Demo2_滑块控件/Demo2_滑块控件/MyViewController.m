//
//  MyViewController.m
//  Demo2_滑块控件
//
//  Created by tarena on 15/10/12.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//界面创建完，显示slider的值到标签上
    //self.label.text=[NSString stringWithFormat:@"%f",self.slider.value];
    
    self.label.backgroundColor=[UIColor colorWithRed:self.slider.value green:self.slider.value  blue:self.slider.value  alpha:1];
}
//滑块滑动时，value改变，执行该方法显示slider的值
- (IBAction)showValue:(id)sender {
//    self.label.text=[NSString stringWithFormat:@"%f",self.slider.value];
    
    //标准的颜色由三个 红 绿 蓝 组成
    //三个值最大为 255
  //但在iOS中，r g b 三个参数要求填写的是 0~1之间的数
    //只要将颜色的十进制的数值除以255
//    [UIColor colorWithRed:1 green:0 blue:0 alpha:1];
    
    //美工：0x 3A 2B 17
    //十进制： 58 43 23
    
    self.label.backgroundColor=[UIColor colorWithRed:self.slider.value green:self.slider.value  blue:self.slider.value  alpha:1];
}


@end
