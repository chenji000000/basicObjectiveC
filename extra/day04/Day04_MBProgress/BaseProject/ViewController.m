//
//  ViewController.m
//  BaseProject
//
//  Created by tarena on 15/12/15.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import <MBProgressHUD.h>

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArr;
@end

@implementation ViewController

- (NSArray *)dataArr {
    if(_dataArr == nil) {
        _dataArr = @[@"弹出提示", @"隐藏提示", @"弹出文字提示2秒钟", @"弹出忙提示2秒钟"];
    }
    return _dataArr;
}

#pragma mark--UITableView
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = self.dataArr[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //取消选中后的高亮状态
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        //弹出提示
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    }
    if (indexPath.row == 1) {
        //隐藏提示
        //隐藏最上方的提示动画
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        //隐藏视图中所有的提示动画
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    }
    if (indexPath.row == 2) {
        //弹出文字提示
        MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        //纯文本模式
        progressHUD.mode = MBProgressHUDModeText;
        progressHUD.labelText = @"当前网络已断开";
        //1.5秒之后 隐藏提示
        [progressHUD hide:YES afterDelay:1.5];
        //移动y轴位置
        progressHUD.yOffset = 100;
    }
    if (indexPath.row == 3) {
        //有动画效果（菊花），也有问题
        MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        progressHUD.labelText = @"正在加载...";
        [progressHUD hide:YES afterDelay:3];
    }
}

- (UITableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(20, 0, 0, 0));
        }];
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView.hidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
