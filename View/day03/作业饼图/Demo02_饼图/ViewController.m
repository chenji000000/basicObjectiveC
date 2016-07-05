//
//  ViewController.m
//  Demo02_饼图
//
//  Created by xiaoz on 15/9/22.
//  Copyright (c) 2015年 xiaoz. All rights reserved.
//

#import "ViewController.h"
#import "PieChartItem.h"
#import "PieChartView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet PieChartView *pieChartView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pieChartView.data = [PieChartItem demoData];
    self.pieChartView.radius = 100;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
