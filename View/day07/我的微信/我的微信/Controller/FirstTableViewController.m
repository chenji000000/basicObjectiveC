//
//  FirstTableViewController.m
//  我的微信
//
//  Created by tarena on 15/11/4.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "FirstTableViewController.h"

@interface FirstTableViewController ()
@property(nonatomic,weak)UIView *coverView;
@end

@implementation FirstTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}
- (IBAction)clickAddButton:(id)sender {
    UIWindow *window=[UIApplication sharedApplication].keyWindow;
    
    UIView *cover=[[UIView alloc] init];
    cover.backgroundColor=[UIColor clearColor];
//    cover.backgroundColor=[UIColor redColor];
    cover.frame=window.bounds;
    [window addSubview:cover];
    self.coverView=cover;
    
    UIImageView *menuImageView=[[UIImageView alloc] init];
    menuImageView.image=[UIImage imageNamed:@"MoreFunctionFrame"];
    menuImageView.frame=CGRectMake(cover.bounds.size.width-100, 62, 100, 100);
    [cover addSubview:menuImageView];
    
    UITapGestureRecognizer *tapGR=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [cover addGestureRecognizer:tapGR];
}

-(void)tap:(UIGestureRecognizer *)gr
{

    [self.coverView removeFromSuperview];

}



@end
