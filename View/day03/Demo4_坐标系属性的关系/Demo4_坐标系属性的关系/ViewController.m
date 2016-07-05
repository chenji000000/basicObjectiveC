//
//  ViewController.m
//  Demo4_坐标系属性的关系
//
//  Created by tarena on 15/10/29.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self printAttributes];
}

- (IBAction)changeFrame:(id)sender
{
    CGRect frame = self.imageView.frame;
    frame.origin.x +=4;
    frame.origin.y +=4;
    frame.size.width+=4;
    frame.size.height +=4;
    self.imageView.frame = frame;
    [self printAttributes];
}

- (IBAction)changeBounds:(id)sender
{
    CGRect bounds = self.imageView.bounds;
    bounds.origin.x +=4;
    bounds.origin.y +=4;
    bounds.size.width+=4;
    bounds.size.height +=4;
    self.imageView.bounds = bounds;
    [self printAttributes];
}

- (IBAction)changeCenter:(id)sender
{
    CGPoint center = self.imageView.center;
    center.x +=4;
    center.y +=4;
    self.imageView.center = center;
    [self printAttributes];
}

- (IBAction)changeTransform:(id)sender
{
    self.imageView.transform = CGAffineTransformScale(self.imageView.transform, 1.1, 1.1);
    self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, M_PI_4);
    self.imageView.transform = CGAffineTransformTranslate(self.imageView.transform, 20, 20);
    [self printAttributes];
}


-(void)printAttributes
{
    NSLog(@"\nframe=%@\nbounds=%@\ncenter=%@\ntransform=%@\n",
          NSStringFromCGRect(self.imageView.frame),
          NSStringFromCGRect(self.imageView.bounds),
          NSStringFromCGPoint(self.imageView.center),
          NSStringFromCGAffineTransform(self.imageView.transform));
}





@end
