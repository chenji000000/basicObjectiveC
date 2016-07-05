//
//  DetalViewController.m
//  Demo1_数组模型
//
//  Created by tarena on 15/10/19.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "DetalViewController.h"


@interface DetalViewController ()


@end

@implementation DetalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=self.city.name;
    
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.city.subAreas.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    cell.textLabel.text=self.city.subAreas[indexPath.row];
    return cell;
}
@end
