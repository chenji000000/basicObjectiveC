//
//  LeftMenuViewController.m
//  BaseProject
//
//  Created by tarena on 15/12/19.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "LeftMenuViewController.h"

@interface LeftMenuViewController ()

@end

@implementation LeftMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor greenColor];
    UIButton *btn = [UIButton buttonWithType:0];
    btn.backgroundColor = [UIColor whiteColor];
    btn.frame = CGRectMake(20, 70, 80, 40);
    [self.view addSubview:btn];
    [btn bk_addEventHandler:^(id sender) {
       //点击按钮 切换内容页
        UIViewController *vc = [UIViewController new];
        vc.view.backgroundColor = [UIColor yellowColor];
        [self.sideMenuViewController setContentViewController:vc];
    } forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
