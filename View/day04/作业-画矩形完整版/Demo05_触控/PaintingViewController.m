//
//  PaintingViewController.m
//  Demo05_触控
//
//  Created by xiaoz on 15/9/22.
//  Copyright (c) 2015年 xiaoz. All rights reserved.
//

#import "PaintingViewController.h"
#import "RectPainting.h"

@interface PaintingViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *colorSegmented;
@property (weak, nonatomic) IBOutlet UIStepper *lineWidthStepper;
@property (weak, nonatomic) IBOutlet RectPainting *paintingView;



@end

@implementation PaintingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 界面刚刚加载时，需要将此时的颜色和宽度设置传给paintingView
    switch (self.colorSegmented.selectedSegmentIndex) {
        case 0:
            self.paintingView.currentLineColor =[UIColor redColor];
            break;
        case 1:
            self.paintingView.currentLineColor = [UIColor greenColor];
            break;
        case 2:
            self.paintingView.currentLineColor = [UIColor blueColor];
            break;
        default:
            break;
    }
    //记录当前线宽
    self.paintingView.currentLineWidth = self.lineWidthStepper.value;
}
//改变颜色选项时触发
- (IBAction)didChangeColor:(UISegmentedControl *)sender {
    switch (self.colorSegmented.selectedSegmentIndex) {
        case 0:
            self.paintingView.currentLineColor =[UIColor redColor];
            break;
        case 1:
            self.paintingView.currentLineColor = [UIColor greenColor];
            break;
        case 2:
            self.paintingView.currentLineColor = [UIColor blueColor];
            break;
        default:
            break;
    }
}

//改变线条粗细选项时触发
- (IBAction)didChangeLineWidth:(UIStepper *)sender {
    self.paintingView.currentLineWidth = self.lineWidthStepper.value;
}




@end
