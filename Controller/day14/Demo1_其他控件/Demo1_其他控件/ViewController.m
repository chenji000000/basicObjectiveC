//
//  ViewController.m
//  Demo1_其他控件
//
//  Created by tarena on 15/10/26.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *ImageView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *SegmentedControl;

@end

@implementation ViewController

- (IBAction)clickChangeHeaderImage:(UISegmentedControl *)sender {
    //选择的按钮的下标
    NSInteger selectedIndex=sender.selectedSegmentIndex;
    
    //格式化图片名
    NSString *imageName=[NSString stringWithFormat:@"fbb0%ld.jpg",selectedIndex+1 ];
    //加载图片到视图中
    self.ImageView.image=[UIImage imageNamed:imageName];
}




- (void)viewDidLoad {
    [super viewDidLoad];
    [self clickChangeHeaderImage:self.SegmentedControl];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
