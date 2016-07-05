//
//  IndicatorViewController.m
//  Demo1_其他控件
//
//  Created by tarena on 15/10/26.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "IndicatorViewController.h"

@interface IndicatorViewController ()
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *IndicatorView;

@end

@implementation IndicatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.IndicatorView.hidesWhenStopped=YES;
    
}

- (IBAction)ClickButton:(id)sender {
    //判断指示器是否正在动画
    if (self.IndicatorView.isAnimating) {
        //停止旋转动画
         [self.IndicatorView stopAnimating];
    }else{
        //开始旋转动画
    [self.IndicatorView startAnimating];
    }
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
