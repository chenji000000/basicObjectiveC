//
//  TRLoginViewController.m
//  Demo4_UITextField
//
//  Created by tarena on 15/10/10.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRLoginViewController.h"

@interface TRLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end

@implementation TRLoginViewController
- (IBAction)Login {
    //获取用户输入的用户名
   NSString *username=self.usernameTF.text;
    //获取用户输入的密码
    NSString *password=self.passwordTF.text;
    //如果用户名是guodh并且密码是abc123
    if([username isEqualToString:@"guodh"]&&[password isEqualToString:@"abc123"]){
        NSLog(@"登陆成功");
        self.resultLabel.text=@"登陆成功";
        }
        else{
            NSLog(@"用户名或密码错误");
            self.resultLabel.text=@"用户名或密码错误";
        }
    
//    //让键盘回去
//    //让passwordTF这个输入框放弃第一响应者身份
//    [self.passwordTF resignFirstResponder];
//   //让usernameTF也放弃第一响应者身份
//    [self.usernameTF resignFirstResponder];
    
    //让键盘回去得更好办法
    [self.view endEditing:YES];
}
//当文本框输入完后，点完成按钮时调用此方法
- (IBAction)TextFieldExit:(id)sender {
    //收键盘
    [self.view endEditing:YES];
}

//当用户点击视图的空白处时，调用此方法
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
//收键盘
    [self.view endEditing:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //让用户名的输入框成为第一响应者
    [self.usernameTF becomeFirstResponder];
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
