//
//  DisplayViewController.m
//  Demo5_正向传值
//
//  Created by tarena on 15/10/23.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "DisplayViewController.h"

@interface DisplayViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation DisplayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.label.text=self.msg;
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
