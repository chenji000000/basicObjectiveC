//
//  MyViewController.m
//  Demo8_开关联动
//
//  Created by tarena on 15/10/12.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *switch1;
@property (weak, nonatomic) IBOutlet UISwitch *switch2;

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)switchChange:(id)sender {
    //switch2与switch1联动
    self.switch2.on=self.switch1.on;
    self.switch2.enabled=self.switch1.on;
   
}


@end
