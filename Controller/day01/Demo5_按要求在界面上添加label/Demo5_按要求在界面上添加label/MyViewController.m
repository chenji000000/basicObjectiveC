//
//  MyViewController.m
//  Demo5_按要求在界面上添加label
//
//  Created by tarena on 15/10/9.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MyViewController.h"


@interface MyViewController ()

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button=[UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"Kit me" forState:UIControlStateNormal];
//    CGFloat width=self.view.bounds.size.width;
//    CGFloat x=width*0.5-140;
    button.frame=CGRectMake(20, 20, 280, 20);
    button.backgroundColor=[UIColor lightGrayColor];
    [button addTarget:self action:@selector(buttonTap) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

-(void)buttonTap
{
    
   NSMutableString* strText=[[NSMutableString alloc] init];
   
    for(int i=0;i<10;i++)
    {
        UILabel *label=[[UILabel alloc] init];
        
        label.frame=CGRectMake(20, 50+i*30, 280, 20);
        
        
        [strText appendFormat:@"hello"];
         label.text=strText;
        
        label.backgroundColor=[UIColor redColor];
        [self.view addSubview:label];
    }
    
    
}

@end
