//
//  ViewController.m
//  Demo3_AutoResizing
//
//  Created by tarena on 15/10/30.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeSystem];
    button.frame=CGRectMake(20, self.view.bounds.size.height-40, 100, 20);
    [button setTitle:@"OK" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:button];
    
    
    //为button添加红线,编写代码时，逻辑与在检查器中的相反，在检查器中，设置的是固定的那个边缘，代码中设置的则是不固定的弹簧的那边，所以，如果需要左和下 固定，则代码需要设置上和右为弹簧
    button.autoresizingMask=UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleRightMargin;
    
}

-(void)viewDidLayoutSubviews
{
    CGFloat buttonWidth=(self.view.bounds.size.width-50)/2;
    CGRect frame=CGRectMake(20, 20, buttonWidth, 40);
    self.button1.frame=frame;
    
    frame.origin.x+=(buttonWidth+10);
    self.button2.frame=frame;


}



@end
