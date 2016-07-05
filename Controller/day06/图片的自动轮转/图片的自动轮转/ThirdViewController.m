//
//  ThirdViewController.m
//  图片的自动轮转
//
//  Created by tarena on 15/10/15.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ThirdViewController.h"
#import "FirstViewController.h"

@interface ThirdViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"第三张图";
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(ClickAddButton:)];
}
-(void)ClickAddButton:(UIBarButtonItem *)item
{
    
    FirstViewController *FirstVC=[[FirstViewController alloc] init];
    
    UINavigationController *navi1=[[UINavigationController alloc] initWithRootViewController:FirstVC];
    
    [self.navigationController presentViewController:navi1 animated:YES completion:nil];
    
    
}


@end
