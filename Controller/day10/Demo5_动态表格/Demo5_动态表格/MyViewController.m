//
//  MyViewController.m
//  Demo5_动态表格
//
//  Created by tarena on 15/10/20.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tv;
@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //纯代码方式创建表视图
    UITableView *tv=[[UITableView alloc] init];
    self.tv=tv;
    tv.frame=CGRectMake(0, 300, 320, 300);
    [self.view addSubview:tv];
    
    tv.dataSource=self;
    tv.delegate=self;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==self.tv) {
        return 7;
    }else{
        return 5;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell1"];
    if(cell==nil){
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell1"];
    
    }
    //判断委托方是那个对象，然后决定单元格的显示内容
    if (tableView==self.tv) {
        cell.textLabel.text=@"Hello Kitty";
    }else{
    cell.textLabel.text=@"Hello World";
    }
    return cell;
}
@end
