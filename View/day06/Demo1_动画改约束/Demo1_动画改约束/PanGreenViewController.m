//
//  PanGreenViewController.m
//  Demo1_动画改约束
//
//  Created by tarena on 15/11/3.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "PanGreenViewController.h"

@interface PanGreenViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstraint;
//用于记录起始时，绿色视图距离顶部的间距
@property(nonatomic)CGFloat topSpacing;

@end

@implementation PanGreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //在没有任何移动之前，保存绿色的起始位置
    self.topSpacing=self.topConstraint.constant;
}
//手势响应时，修改绿色视图的top约束中的constant即可
- (IBAction)moveGreenView:(UIPanGestureRecognizer *)sender {
    //手势走了多少距离
    CGPoint translation=[sender translationInView:self.view];
    //在原有的起始值上增加手势的偏移量，作为竖直方向的新的约束值
    self.topConstraint.constant=translation.y+self.topSpacing;
    
    //判断手势的状态，是否是结束状态
    if(sender.state==UIGestureRecognizerStateEnded){
    //恢复绿色视图的顶端距离为初始值即可
        self.topConstraint.constant=self.topSpacing;
        //为了控制弹回的状态，添加动画
//    duratation:动画时长
//        delay：延迟几秒后
//        option：动画的种类（EaseInout 先快后慢
//        EaseIn 越来越快
//         EaseOut 越来越慢
//        Linear 匀速）
//    animations:是一个block，块内，要么设置视图的结束状态，如果是改约束的动画，则调用父视图的layoutIfNeeded方法
//        completion：是一个有BOOL参数的block，在动画完成时做什么）
        [UIView animateWithDuration:2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            [self.view layoutIfNeeded];
        } completion:nil];
        
    }
    
}


@end
