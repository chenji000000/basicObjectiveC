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
    self.navigationItem.title=@"城市详情";
    UILabel *label1=[[UILabel alloc] init];
    label1.frame=CGRectMake(20, 100, 150, 30);
    label1.backgroundColor=[UIColor redColor];
    label1.text=self.city.name;
    [self.view addSubview:label1];
    
    UILabel *label2=[[UILabel alloc] init];
    label2.frame=CGRectMake(20, 200, 150, 30);
    label2.text=[NSString stringWithFormat:@"%ld万",self.city.population];
    label2.backgroundColor=[UIColor redColor];
    [self.view addSubview:label2];
    
}


@end
