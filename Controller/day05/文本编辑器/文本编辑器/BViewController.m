//
//  BViewController.m
//  文本编辑器
//
//  Created by tarena on 15/10/14.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "BViewController.h"

@interface BViewController ()
@property (weak, nonatomic) IBOutlet UITextField *xTextField;
@property (weak, nonatomic) IBOutlet UITextField *yTextField;
@property (weak, nonatomic) IBOutlet UITextField *widthTextField;
@property (weak, nonatomic) IBOutlet UITextField *heightTextField;


@property (weak, nonatomic) IBOutlet UITextField *nameTextField;


@end

@implementation BViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
-(void)finish
{
    CGRect frame=CGRectMake([self.xTextField.text floatValue], [self.yTextField.text floatValue], [self.widthTextField.text floatValue], [self.heightTextField.text floatValue]);
    [self.delegate BViewController:self andFrame:frame andText:self.nameTextField.text];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)goBack:(UIButton *)sender {
    [self finish];
}
- (IBAction)done:(id)sender {
    [self finish];
}

@end
