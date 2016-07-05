//
//  BViewController.m
//  Demo3_正向传值
//
//  Created by tarena on 15/10/14.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "BViewController.h"

@interface BViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation BViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //将传入的str显示在标签上
    self.label.text=self.str;
    
}
- (IBAction)goBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
