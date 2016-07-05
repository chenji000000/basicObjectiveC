//
//  ViewController.m
//  Demo10_拖拽手势
//
//  Created by tarena on 15/10/28.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIPanGestureRecognizer *PanGR=[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    
    
    [self.view addGestureRecognizer:PanGR];
    
    
    
}
-(void)pan:(UIPanGestureRecognizer *)gr
{
    //获取触点相对于self.view的左顶点的绝对坐标值
    CGPoint point=[gr locationInView:self.view];
    
    //获取当前触点相对于手势起始时触点位置的横向及纵向距离
//    CGPoint translation=[gr translationInView:self.view];
//    NSLog(@"%@",NSStringFromCGPoint(translation));
    
    self.imageView.center=point;
    

}

@end
