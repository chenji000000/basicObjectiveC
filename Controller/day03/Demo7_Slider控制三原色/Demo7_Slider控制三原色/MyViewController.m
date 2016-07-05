//
//  MyViewController.m
//  Demo7_Slider控制三原色
//
//  Created by tarena on 15/10/12.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()
@property (weak, nonatomic) IBOutlet UISlider *sliderRed;
@property (weak, nonatomic) IBOutlet UISlider *sliderGreen;
@property (weak, nonatomic) IBOutlet UISlider *sliderBlue;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.label.backgroundColor=[UIColor colorWithRed:self.sliderRed.value green:self.sliderGreen.value blue:self.sliderBlue.value alpha:1];
}
- (IBAction)showValue:(id)sender {
    self.label.backgroundColor=[UIColor colorWithRed:self.sliderRed.value green:self.sliderGreen.value blue:self.sliderBlue.value alpha:1];
}

@end
