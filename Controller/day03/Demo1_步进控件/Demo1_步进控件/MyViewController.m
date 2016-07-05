//
//  MyViewController.m
//  Demo1_步进控件
//
//  Created by tarena on 15/10/12.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()
@property (weak, nonatomic) IBOutlet UIStepper *stepper;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //使用代码的方式设置stepper的属性
    
//    //设置最小值
//    self.stepper.minimumValue=-10;
//    //设置最最大值
//    self.stepper.maximumValue=10;
//    //设置步进规律
//    self.stepper.stepValue=2;
//    //设置当前value
//    self.stepper.value=5;
    
    self.stepper.minimumValue=13;
    
    self.stepper.maximumValue=24;
    
    self.stepper.stepValue=1;
    
    self.stepper.value=13;
    
    //显示stepper的value到标签上
//    self.label.text=[NSString stringWithFormat:@"%f",self.stepper.value];
    //通过stepper的value设置label的字体大小
   self.label.font=[UIFont systemFontOfSize: self.stepper.value];
    
    
    
   
}
//当stepper的value改变时，执行该方法
- (IBAction)showValue:(UIStepper *)sender {
//   self.label.text=[NSString stringWithFormat:@"%f",sender.value];
    
    self.label.font=[UIFont systemFontOfSize: sender.value];
}

@end
