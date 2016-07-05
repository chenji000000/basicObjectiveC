//
//  MyViewController.m
//  Demo2_多导航的切换
//
//  Created by tarena on 15/10/15.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MyViewController.h"
#import "OtherViewController.h"

@interface MyViewController ()

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"查看信息";
    
    //配置导航栏的右侧 增加  按钮
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(ClickAddButton:)];
}

-(void)ClickAddButton:(UIBarButtonItem *)item
{
//1.推出otherViewController
    OtherViewController *otherVC=[[OtherViewController alloc] init];
    //2.为otherVC套一个新的导航
    UINavigationController *navi2=[[UINavigationController alloc] initWithRootViewController:otherVC];
    //3.从当前控制器的导航，切换到navi2
    [self.navigationController presentViewController:navi2 animated:YES completion:nil];


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
