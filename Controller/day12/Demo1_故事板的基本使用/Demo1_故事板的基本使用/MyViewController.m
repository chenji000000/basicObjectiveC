//
//  MyViewController.m
//  Demo1_故事板的基本使用
//
//  Created by tarena on 15/10/22.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)clickButton:(id)sender {
    
    self.label.text=@"Hello Kitty";
}


@end
