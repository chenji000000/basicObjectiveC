//
//  SecondViewController.m
//  Demo5_TabBar_改良版
//
//  Created by tarena on 15/10/21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

-(instancetype)init
{
    self=[super init];
    if (self) {
        self.title=@"第二个";
//        self.tabBarItem.title=@"第二个";
        self.tabBarItem.image=[UIImage imageNamed:@"line_cart"];
        self.tabBarItem.selectedImage=[UIImage imageNamed:@"full_cart"];
    }
    return self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
