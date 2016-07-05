//
//  TRMessageViewController.m
//  Demo6_TMessage
//
//  Created by tarena on 15/10/10.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRMessageViewController.h"

@interface TRMessageViewController ()
@property(strong,nonatomic) UILabel* label;
@property(strong,nonatomic) UITextField* tf;
@end

@implementation TRMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITextField *tf=[[UITextField alloc] init];
    self.tf=tf;
    tf.frame=CGRectMake(20, 20, 140, 20);
    tf.backgroundColor=[UIColor grayColor];
    
    [self.view addSubview:tf];
    
    
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"点击" forState:UIControlStateNormal];
    button.frame=CGRectMake(200, 20, 140, 20);
    button.backgroundColor=[UIColor grayColor];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(buttonTap) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)buttonTap
{
    UILabel *label=[[UILabel alloc] init];
    
    self.label=label;
    label.frame=CGRectMake(20, 40, 280, 40);
    NSString* str=self.tf.text;
    
    label.text=str;
    label.backgroundColor=[UIColor redColor];
    
    CGRect frame=label.frame;
    frame.origin.y+=10;
    label.frame=frame;
    [self.view addSubview:label];
    
    [self.view endEditing:YES];
    self.tf.text=@"";
}

@end
