//
//  ViewController.m
//  气泡视图升级
//
//  Created by tarena on 15/10/28.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import "PopView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet PopView *popView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.popView.headerImage=[UIImage imageNamed:@"icon120"];
    
    self.popView.message=@"dhuisahfiuashfjhfudhfushfuihsuhuhduishdfushdhduhsuhuehdjhufhd";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
