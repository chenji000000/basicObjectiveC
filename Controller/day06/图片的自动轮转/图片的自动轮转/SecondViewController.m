//
//  SecondViewController.m
//  图片的自动轮转
//
//  Created by tarena on 15/10/15.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *ImageView;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"第二张图";
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(ClickAddButton:)];
    
}
-(void)ClickAddButton:(UIBarButtonItem *)item
{
    
    ThirdViewController *thirdVC=[[ThirdViewController alloc] init];
    
    UINavigationController *navi3=[[UINavigationController alloc] initWithRootViewController:thirdVC];
    
    [self.navigationController presentViewController:navi3 animated:YES completion:nil];
    
    
}

@end
