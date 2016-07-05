//
//  FirstViewController.m
//  图片的自动轮转
//
//  Created by tarena on 15/10/15.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *ImageView;


@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"第一张图";
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(ClickAddButton:)];
}
-(void)ClickAddButton:(UIBarButtonItem *)item
{
    
    SecondViewController *secondVC=[[SecondViewController alloc] init];
    
    UINavigationController *navi2=[[UINavigationController alloc] initWithRootViewController:secondVC];
    
    [self.navigationController presentViewController:navi2 animated:YES completion:nil];
    
    
}

@end
