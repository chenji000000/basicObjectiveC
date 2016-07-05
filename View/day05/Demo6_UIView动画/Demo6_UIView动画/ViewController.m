//
//  ViewController.m
//  Demo6_UIView动画
//
//  Created by tarena on 15/11/2.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
//点击空白处小飞机飞到距离屏幕顶端100个点的位置
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint center=self.imageView.center;
    center.y=100;
[UIView animateWithDuration:2 animations:^{
    //设置动画结束时，小飞机的状态即可
    
    self.imageView.center=center;
}];

}

@end
