//
//  ViewController.m
//  Day02_PlugIns
//
//  Created by tarena on 15/12/15.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@end
@implementation ViewController
- (id)initWithName:(NSString *)userName age:(NSUInteger)age sex:(NSString *)sex{
    if (self = [super init]) {
        
    }
    return self;
}

// -tablenumber
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
//-tablecellfor
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//加载图片, KSImageNames -> imageNamed方法自动弹出图片
    UIImage *image = [UIImage imageNamed:@"Snip20150825_2"];
//代码特效在xcode上方 plugIns中把enable关掉即可
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:nil forControlEvents:UIControlEventTouchUpInside];
//   Fuzzy: 只需要输入 一些特定的词汇,就可以弹出提示
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end






