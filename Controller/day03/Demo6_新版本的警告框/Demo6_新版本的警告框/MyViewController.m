//
//  MyViewController.m
//  Demo6_新版本的警告框
//
//  Created by tarena on 15/10/12.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
//点击按钮后，弹出警告框
- (IBAction)showAlert:(id)sender {
    //1.创建alertController实例，并说明样式
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"title" message:@"message" preferredStyle:UIAlertControllerStyleAlert];
    //2.创建按钮行为
    UIAlertAction *yesAction=[UIAlertAction actionWithTitle:@"YES" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        NSLog(@"点击了YES按钮");
    }];
    
    UIAlertAction *noAction=[UIAlertAction actionWithTitle:@"NO" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        //获取在文本框中输入的内容
        UITextField *nameText=alertController.textFields[0];
        NSLog(@"%@",nameText.text);
//        NSLog(@"点击了NO按钮");
    }];
    
    //3.添加行为到控制器中
    [alertController addAction:yesAction];
    [alertController addAction:noAction];
    
    //4.添加文本框到控制器中
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        //对添加的文本框进行设置
        textField.font=[UIFont systemFontOfSize:24];
        textField.textColor=[UIColor redColor];
    }];
    
    
    //5.推出控制器，显示界面
    //两个控制器之间的切换，方法一就是使用present方法
    [self presentViewController:alertController animated:YES completion:nil];
    
}
//点击按钮后，推出操作表
- (IBAction)showActionSheet:(id)sender {
    //1.创建alertController实例，并说明样式
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"title" message:@"message" preferredStyle:UIAlertControllerStyleActionSheet];
    //2.创建按钮行为
    UIAlertAction *yesAction=[UIAlertAction actionWithTitle:@"YES" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        NSLog(@"点击了YES按钮");
    }];
    
    UIAlertAction *noAction=[UIAlertAction actionWithTitle:@"NO" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        NSLog(@"点击了NO按钮");
    }];
    //3.添加行为到控制器中
    [alertController addAction:yesAction];
    [alertController addAction:noAction];
    //4.推出控制器，显示界面
    //两个控制器之间的切换，方法一就是使用present方法
    [self presentViewController:alertController animated:YES completion:nil];
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
