//
//  AViewController.m
//  Demo5_反向传值_代理模式
//
//  Created by tarena on 15/10/14.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "AViewController.h"
#import "BViewController.h"

//1.遵守协议
@interface AViewController ()<BViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation AViewController

//2.实现方法
-(void)bViewController:(BViewController *)bvc didFinishInput:(NSString *)str
{
    //将发来的消息显示在标签上
    self.label.text=str;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
}
//点击按钮后推出B界面
- (IBAction)gotoBVC:(id)sender {
    
    //创建bvc的实例
    BViewController *bvc=[[BViewController alloc] initWithNibName:@"BViewController" bundle:nil];
    //3.将自己设置成为代理
    bvc.delegate=self;
    
    //推出
    [self presentViewController:bvc animated:YES completion:nil];
}


@end
