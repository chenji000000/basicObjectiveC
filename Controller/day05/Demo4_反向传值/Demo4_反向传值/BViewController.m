//
//  BViewController.m
//  Demo4_反向传值
//
//  Created by tarena on 15/10/14.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "BViewController.h"

@interface BViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation BViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

//点击按钮后回到A界面
- (IBAction)goBack:(id)sender {
    //返回之前，将要回传的数值赋给avc
    self.backReference.backValue=self.textField.text;
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


@end
