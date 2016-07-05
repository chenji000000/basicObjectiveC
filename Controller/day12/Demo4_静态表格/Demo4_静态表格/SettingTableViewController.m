//
//  SettingTableViewController.m
//  Demo4_静态表格
//
//  Created by tarena on 15/10/22.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "SettingTableViewController.h"

@interface SettingTableViewController ()
@property (weak, nonatomic) IBOutlet UILabel *wechatNumLabel;
@property (weak, nonatomic) IBOutlet UILabel *qqNumLabel;

@end

@implementation SettingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.wechatNumLabel.text=@"qqqqq";
    self.qqNumLabel.text=@"65442";
    
}
- (IBAction)clickSwitch:(id)sender {
    
    NSLog(@"xxxx");
}




@end
