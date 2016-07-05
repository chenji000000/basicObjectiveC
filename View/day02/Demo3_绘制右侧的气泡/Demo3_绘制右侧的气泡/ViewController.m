//
//  ViewController.m
//  Demo3_绘制右侧的气泡
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
    self.popView.message=@"dhuisahfiuashfjhfudhfushfuihsuhuhduishdfushdhduhsuhuehdjhufhd";
    
}


@end
