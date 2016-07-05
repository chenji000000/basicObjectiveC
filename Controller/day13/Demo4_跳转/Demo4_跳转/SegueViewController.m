//
//  SegueViewController.m
//  Demo4_跳转
//
//  Created by tarena on 15/10/23.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "SegueViewController.h"

@interface SegueViewController ()

@end

@implementation SegueViewController


//点击空白处推出绿色vc
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //从当前VC所对应的场景，拉出来的Segue线只要起了identifier，那么不管原来连线时，事件源是否明确，都可以使用performSegueWithIdentifier方法触发该连线对应的跳转动作
    [self performSegueWithIdentifier:@"gotoGreenSegue" sender:nil];


}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
