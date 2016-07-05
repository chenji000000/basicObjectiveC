//
//  MyViewController.m
//  Demo3_开关控件
//
//  Created by tarena on 15/10/12.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *mySwitch;
@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}
//点击按钮时，修改开关的状态
- (IBAction)changeSwitch:(id)sender {
    //通过set方法修改on的值，并且在修改时带有动画
    [self.mySwitch setOn:!self.mySwitch.on animated:YES];
    self.mySwitch.on=!self.mySwitch.on;
//    if(self.mySwitch.on){
//    self.mySwitch.on=NO;
//    }else{
//    self.mySwitch.on=YES;
//    }
    
}
//点击switch开关时，修改按钮是否可用
//点击switch开关时，执行该方法
//此方法，只有是通过用户的交互改变了开关时才执行响应
//如果通过点击按钮，并使用代码的方式来修改switch的状态的话，那么此方法不执行
- (IBAction)changeButtonState:(id)sender {
    //当switch是开的状态，按钮可用
    //当switch是关的状态，按钮不可用
    //switch on YES NO
    //button enabled YES NO
    self.button.enabled=self.mySwitch.on;
}


@end
