//
//  ViewController.m
//  Day02_Cocoapods
//
//  Created by tarena on 15/12/15.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>

@interface ViewController ()
/** 红色视图,屏幕中心, 宽高100,100 */
@property(nonatomic,strong) UIView *redView;
@end
@implementation ViewController
- (UIView *)redView {
    if(_redView == nil) {
        _redView = [[UIView alloc] init];
        _redView.backgroundColor=[UIColor redColor];
        [self.view addSubview:_redView];
        [_redView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.mas_equalTo(self.view);
            make.size.mas_equalTo(CGSizeMake(100, 100));
        }];
    }
    return _redView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.redView.hidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
