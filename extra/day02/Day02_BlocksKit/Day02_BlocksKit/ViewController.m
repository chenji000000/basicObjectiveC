//
//  ViewController.m
//  Day02_BlocksKit
//
//  Created by tarena on 15/12/15.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>

/**
 *  改写UI开头的类的target+selector或委托模式
 */
#import <BlocksKit+UIKit.h>
/**
 *  改写NS开头的类
 */
#import <BlocksKit.h>


@interface ViewController ()<UIAlertViewDelegate>
/**
 *  红色按钮，左上角20，宽高100，50，点击后打印‘aaa’
 */
@property (nonatomic, strong) UIButton *redBtn;
/**
 *  蓝色按钮，右上角20，宽高100，50，点击后弹出提示框
 */
@property (nonatomic, strong) UIButton *blueBtn;
@end

@implementation ViewController

- (UIButton *)redBtn {
    if(_redBtn == nil) {
        _redBtn = [[UIButton alloc] init];
        _redBtn.backgroundColor = [UIColor redColor];
        [self.view addSubview:_redBtn];
        [_redBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(20);
            make.size.mas_equalTo(CGSizeMake(100, 50));
        }];
        [_redBtn addTarget:self action:@selector(clicks:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _redBtn;
}

- (UIButton *)blueBtn {
    if(_blueBtn == nil) {
        _blueBtn = [UIButton buttonWithType:0];
        _blueBtn.backgroundColor =[UIColor blueColor];
        [self.view addSubview:_blueBtn];
        [_blueBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(20);
            make.right.mas_equalTo(-20);
            make.size.mas_equalTo(self.redBtn);
        }];
        
        /**
         *  使用blocksKit为蓝色按钮添加点击方法，bk_开头的方法
         */
        [_blueBtn bk_addEventHandler:^(id sender) {
            NSLog(@".......");
            [UIAlertView bk_showAlertViewWithTitle:@"blueBtn" message:@"Message" cancelButtonTitle:@"Cancel" otherButtonTitles:@[@"yes"] handler:^(UIAlertView *alertView, NSInteger buttonIndex) {
                if (buttonIndex == 0) {
                    NSLog(@"cancel");
                }
                if (buttonIndex == 1) {
                    NSLog(@"yes");
                }
            }];
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _blueBtn;
}

- (void)clicks:(UIButton *)sender{
    NSLog(@"aaa");
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"红色按钮" message:@"message" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"确定", nil];
    [alertView show];
}

#pragma mark--UIAlertView
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        NSLog(@"cancel");
    }
    if (buttonIndex == 1) {
        NSLog(@"yes");
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.redBtn.hidden = NO;
    self.blueBtn.hidden = NO;
    [NSTimer bk_scheduledTimerWithTimeInterval:1 block:^(NSTimer *timer) {
        NSLog(@"1111");
    } repeats:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
