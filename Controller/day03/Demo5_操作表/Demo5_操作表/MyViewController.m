//
//  MyViewController.m
//  Demo5_操作表
//
//  Created by tarena on 15/10/12.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()<UIActionSheetDelegate>

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
//点击按钮后，弹出操作表选项
- (IBAction)shareTo:(id)sender {
    //1.创建操作表
    UIActionSheet *sheet=[[UIActionSheet alloc] initWithTitle:@"title" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"危险" otherButtonTitles:@"微博",@"微信",@"朋友圈", nil];
    
    //2.显示操作表
    [sheet showInView:self.view];
}

#pragma  mark - UIActionSheetDelegate协议
//点击了actionSheet的按钮后，自定执行该方法
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //在actionSheet中可以根据选中的按钮索引，获取按钮上的文字标题
    NSString *selectedTitle=[actionSheet buttonTitleAtIndex:buttonIndex];
    if([selectedTitle isEqualToString:@"危险"])
    {
        NSLog(@"点击了危险按钮");
    }
   // NSLog(@"%ld",buttonIndex);
}

@end
