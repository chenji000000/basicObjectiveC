//
//  ViewController.m
//  作业2
//
//  Created by tarena on 15/11/2.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint center1=self.imageView.center;
    center1.y=self.view.bounds.size.height-50;
    CGPoint center2=self.label.center;
    center2.x=self.view.bounds.size.width+200;
    [UIView animateWithDuration:5 animations:^{
        self.imageView.center=center1;
        self.label.center=center2;
    }];


}

@end
