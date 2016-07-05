//
//  ViewController.m
//  控制图片视图保持与手势的移动节奏一致
//
//  Created by tarena on 15/10/28.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *ImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIPanGestureRecognizer *panGR=[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.view addGestureRecognizer:panGR];
}

-(void)pan:(UIPanGestureRecognizer *)gr
{
    CGPoint translation=[gr translationInView:self.view];


    self.ImageView.center=translation;

}



@end
