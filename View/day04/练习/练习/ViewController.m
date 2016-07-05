//
//  ViewController.m
//  练习
//
//  Created by tarena on 15/10/30.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button4;
@property (weak, nonatomic) IBOutlet UIButton *button5;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)viewDidLayoutSubviews
{
    CGRect frame=self.button1.frame;
    frame.origin.x=20;
    frame.origin.y=20;
    frame.size.width=(self.view.bounds.size.width-50)/2;
    frame.size.height=40;
    self.button1.frame=frame;
    
    frame=self.button2.frame;
    frame.origin.x=30+(self.view.bounds.size.width-50)/2;
    frame.origin.y=20;
    frame.size.width=(self.view.bounds.size.width-50)/2;
    frame.size.height=40;
    self.button2.frame=frame;
    
    frame=self.imageView.frame;
    frame.origin.x=20;
    frame.origin.y=70;
    frame.size.width=self.view.bounds.size.width-40;
    frame.size.height=self.view.bounds.size.height-120;
    self.imageView.frame=frame;
    
    frame=self.button3.frame;
    frame.origin.x=self.view.bounds.size.width-100;
    frame.origin.y=self.view.bounds.size.height-40;
    frame.size.width=20;
    frame.size.height=20;
    self.button3.frame=frame;
    
    frame=self.button4.frame;
    frame.origin.x=self.view.bounds.size.width-70;
    frame.origin.y=self.view.bounds.size.height-40;
    frame.size.width=20;
    frame.size.height=20;
    self.button4.frame=frame;
    
    frame=self.button5.frame;
    frame.origin.x=self.view.bounds.size.width-40;
    frame.origin.y=self.view.bounds.size.height-40;
    frame.size.width=20;
    frame.size.height=20;
    self.button5.frame=frame;
    
    
    

}


@end
