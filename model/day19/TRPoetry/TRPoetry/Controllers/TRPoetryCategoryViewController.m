//
//  TRPoetryCategoryViewController.m
//  TRPoetry
//
//  Created by tarena on 15/11/27.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "TRPoetryCategoryViewController.h"
#import "Masonry.h"

@interface TRPoetryCategoryViewController ()
@property (nonatomic, strong) UITextView *textView;
@end

@implementation TRPoetryCategoryViewController

- (UITextView *)textView
{
    if (!_textView) {
        _textView = [UITextView new];
        _textView.font = [UIFont systemFontOfSize:18];
        //不可编辑
        _textView.editable = NO;
    }
    return _textView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.textView];
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    self.textView.text = self.poetryCategoryStr;
    self.textView.contentOffset = CGPointMake(0, 0);
    
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
