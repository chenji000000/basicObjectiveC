//
//  BViewController.m
//  Demo5_反向传值_代理模式
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
//点击返回按钮后，回到A界面
- (IBAction)goBack:(id)sender {
    
    //3.在即将消失之前，给代理发消息，告诉要显示的内容是什么
    [self.delegate bViewController:self didFinishInput:self.textField.text];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
