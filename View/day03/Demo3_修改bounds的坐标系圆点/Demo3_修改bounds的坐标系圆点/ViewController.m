//
//  ViewController.m
//  Demo3_修改bounds的坐标系圆点
//
//  Created by tarena on 15/10/29.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGRect bounds = self.view.bounds;
    bounds.origin.y += 2;
    self.view.bounds = bounds;
    
    NSLog(@"%@",NSStringFromCGRect(self.view.bounds));
    
}








@end
