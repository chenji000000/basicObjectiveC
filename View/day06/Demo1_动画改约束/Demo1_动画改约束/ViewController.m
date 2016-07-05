//
//  ViewController.m
//  Demo1_动画改约束
//
//  Created by tarena on 15/11/3.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomSpaceConstraint;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //设置动画结束时的状态
    //设置飞机停止时，底部间距约束的数值
    //self.view.bottom=img.bottom*1+50
    //img.bottom=self.view.bottom*1+(-50)
    self.bottomSpaceConstraint.constant=500;
    
[UIView animateWithDuration:5 animations:^{
    
    [self.view layoutIfNeeded];
}];


}


@end
