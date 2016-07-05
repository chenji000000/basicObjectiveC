//
//  TRMusicViewController.m
//  Demo5_TMusic项目
//
//  Created by tarena on 15/10/10.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRMusicViewController.h"

@interface TRMusicViewController ()
@property (weak, nonatomic) IBOutlet UITextField *UserName;
@property (weak, nonatomic) IBOutlet UITextField *PassWord;
@property (weak, nonatomic) IBOutlet UILabel *ResultLabel;

@end

@implementation TRMusicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)Login:(id)sender {
    NSString *username=self.UserName.text;
    NSString *password=self.PassWord.text;
    if([username isEqualToString:@"chenji"]&&[password isEqualToString:@"abc123"])
    {
    self.ResultLabel.text=@"chenji在线";
    }
    else if(username==nil||password==nil)
    {
    self.ResultLabel.text=@"请输入用户名和密码";
    }
    else
    {
    self.ResultLabel.text=@"未登录";
    }
   
}
- (IBAction)Next:(id)sender {
    [self.PassWord  becomeFirstResponder];
}


@end
