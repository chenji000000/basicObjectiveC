//
//  AViewController.m
//  文本编辑器
//
//  Created by tarena on 15/10/14.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "AViewController.h"
#import "BViewController.h"

@interface AViewController ()<BViewControllerDelegate>

@end

@implementation AViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)gotobvc:(UIButton *)sender {
    BViewController *bvc=[[BViewController alloc] initWithNibName:@"BViewController" bundle:nil];
    
    bvc.delegate=self;
    [self presentViewController:bvc animated:YES completion:nil];
}
-(void)BViewController:(id)bViewController andFrame:(CGRect)frame andText:(NSString *)text
{
    UILabel *label=[[UILabel alloc] initWithFrame:frame];
    label.text=text;
    label.backgroundColor=[UIColor redColor];
    [self.view addSubview:label];
}

@end
