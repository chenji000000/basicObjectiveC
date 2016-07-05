//
//  ViewController.m
//  BaseProject
//
//  Created by tarena on 15/12/15.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import "NewsNetManager.h"

@interface ViewController ()
@property (nonatomic, strong) UIButton *button;

@end

@implementation ViewController

- (UIButton *)button {
    if(_button == nil) {
        _button = [UIButton buttonWithType:0];
        _button.backgroundColor = [UIColor redColor];
        [self.view addSubview:_button];
        [_button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(20);
            make.size.mas_equalTo(CGSizeMake(100, 60));
        }];
        [_button bk_addEventHandler:^(id sender) {
            [self showAlert:@"按钮被点击"];
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [NewsNetManager getVideosWithStartIndex:1 completionHandle:^(id model, NSError *error) {
        if (!error) {
            NSLog(@"model %@", model);
        }
    }];
    self.button.hidden = NO;
    NSLog(@"1111111");
    
    DDLogVerbose(@"verbose");
    DDLogInfo(@"logInfo");
    DDLogWarn(@"logWarn");
    DDLogError(@"error");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
