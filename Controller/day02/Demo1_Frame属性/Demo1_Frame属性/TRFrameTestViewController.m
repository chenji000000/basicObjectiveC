//
//  TRFrameTestViewController.m
//  Demo1_Frame属性
//
//  Created by tarena on 15/10/10.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRFrameTestViewController.h"

@interface TRFrameTestViewController ()
@property(strong,nonatomic) UILabel*label;

@end

@implementation TRFrameTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(40, 60, 300, 40)];
    self.label=label;//让属性的引用指向label对象
    label.text=@"你好呵呵呵呵！一个虾38呀";
    label.backgroundColor=[UIColor lightGrayColor];
    [self.view addSubview:label];
    
    UIButton *moveButton=[UIButton buttonWithType:UIButtonTypeSystem];
    [moveButton setTitle:@"移动标签" forState:UIControlStateNormal];
    moveButton.frame=CGRectMake(40, 400, 300, 40);
    moveButton.backgroundColor=[UIColor greenColor];
    moveButton.tintColor=[UIColor redColor];
    [self.view addSubview:moveButton];
    
    [moveButton addTarget:self action:@selector(moveButtonTap) forControlEvents:UIControlEventTouchUpInside];
}

-(void)moveButtonTap
{
//    self.label.frame.origin.x=100;
//    self.label.frame.origin.y=100;
//    self.label.frame=CGRectMake(100, 200, 200, 80);
    //拿出来
    CGRect frame=self.label.frame;
    //改一改
    frame.origin.y+=10;
    //放回去
   self.label.frame=frame;
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
