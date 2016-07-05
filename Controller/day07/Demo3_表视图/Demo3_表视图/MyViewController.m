//
//  MyViewController.m
//  Demo3_表视图
//
//  Created by tarena on 15/10/16.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.创建表视图的实例
    UITableView *tv=[[UITableView alloc] init];
    //2.设置表视图的frame
    tv.frame=self.view.bounds;
    
    //3.添加表视图到控制器的view中
    [self.view addSubview:tv];
    
    //目标：设置表格中的数据
    //表格的数据
    tv.dataSource=self;
    
    //目标：响应表格与用户的交互
    //自定义界面及与用户的交互
    tv.delegate=self;


}


#pragma mark - UITableViewDataSource 协议

//回答三问：

//1.整个表格有几个分区(NSInteger,n)
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}



//2.每个分区有几行(NSInteger,t)
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 10;
}




//3.每一行内容是什么(UITableViewCell,t)
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc] init];
    cell.textLabel.text=@"Hello World";
    
    
    return cell;

}

#pragma mark - UITableViewDelegate 协议
//回答：一答
//4.如果选中了某行，如何响应(t,s)
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"点击了某行");
}


@end
