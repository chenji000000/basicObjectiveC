//
//  MyViewController.m
//  Demo1_表视图
//
//  Created by tarena on 15/10/17.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tv=[[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.view addSubview:tv];
    
    tv.dataSource=self;
    tv.delegate=self;
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {//第一个分区有3行
        return 3;
    }else if (section==1){//第二个分区有4行
        return 4;
    }else{//第三个分区有2行
        return 2;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc] init];
    
    if(indexPath.section==0){
    cell.textLabel.text=@"Hello";
    }else if (indexPath.section==1){
    cell.textLabel.text=@"Hello World";
    }else{
        cell.textLabel.text=@"Hello Kitty";
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"section=%ld,row=%ld",indexPath.section,indexPath.row);
}
@end
