//
//  TRIBViewController.m
//  Demo2_interfaceBuilder
//
//  Created by tarena on 15/10/10.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRIBViewController.h"

@interface TRIBViewController ()
@property(weak,nonatomic)IBOutlet UILabel* label;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property(weak,nonatomic)IBOutlet UIButton* button;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@end

@implementation TRIBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.button addTarget:self action:@selector(buttonTap) forControlEvents:UIControlEventTouchUpInside];
}
-(void)buttonTap
{
    
    self.label.text=@"这是修改的内容";
}
- (IBAction)button2Tap:(UIButton *)sender {
    self.label2.text=@"这是第二个按钮按下的结果";
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
