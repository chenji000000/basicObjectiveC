//
//  AViewController.m
//  Demo2_导航控制器
//
//  Created by tarena on 15/10/14.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "AViewController.h"
#import "BViewController.h"

@interface AViewController ()

@end

@implementation AViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航栏上的文字项
    self.navigationItem.title=@"A界面";
}
//点击按钮后跳到B界面
- (IBAction)gotoBVC:(id)sender {
    //1.创建B界面所属的控制器的实例
    BViewController *bvc=[[BViewController alloc] initWithNibName:@"BViewController" bundle:nil];
    
    //2.是由当前管理的avc的上面的那个导航负责push出新的B界面
    [self.navigationController pushViewController:bvc animated:YES];
    
}


@end
