//
//  FirstViewController.m
//  Demo5_TabBar_改良版
//
//  Created by tarena on 15/10/21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

-(instancetype)init
{
    self=[super init];
    if (self) {
        self.title=@"第一个";
//        self.tabBarItem.title=@"第一个";
        self.tabBarItem.image=[UIImage imageNamed:@"line_bell"];
        self.tabBarItem.selectedImage=[UIImage imageNamed:@"full_bell"];
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
