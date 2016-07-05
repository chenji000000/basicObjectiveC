//
//  AViewController.m
//  Demo3_正向传值
//
//  Created by tarena on 15/10/14.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "AViewController.h"
#import "BViewController.h"

@interface AViewController ()
@property (weak, nonatomic) IBOutlet UITextField *TextField;

@end

@implementation AViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
//点击按钮后跳到B界面，并且将文本框的值传给B
- (IBAction)gotoB:(id)sender {
    //1.创建B的控制器实例
    BViewController *bvc=[[BViewController alloc] initWithNibName:@"BViewController" bundle:nil];
    
    //2.在推出B之前，给B赋值，完成传值的过程
    bvc.str=self.TextField.text;
    
    //3.推出
    [self presentViewController:bvc animated:YES completion:nil];
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
