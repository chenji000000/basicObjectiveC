//
//  ViewController.m
//  Demo7_反向传值
//
//  Created by tarena on 15/10/23.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import "InputViewController.h"

@interface ViewController ()<InputViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController


-(void)InputViewController:(InputViewController *)vc didInputString:(NSString *)nsg

{
    self.label.text=nsg;
}

//截获跳转动作，获取系统创建的目标VC，将自己设置为InputViewController的代理
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    InputViewController *vc=segue.destinationViewController;
    vc.delegate=self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
