//
//  AddCityViewController.m
//  Demo4_增加数据
//
//  Created by tarena on 15/10/19.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "AddCityViewController.h"

@interface AddCityViewController ()
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *population;


@end

@implementation AddCityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

//点击保存按钮后，将数据封装成一个新的City对象
//返回给第一个界面
- (IBAction)goBack:(UIButton *)sender {
    
    City *newCity=[[City alloc] init];
    newCity.name=self.name.text;
    newCity.population=[self.population.text intValue];
    //给第一个界面发消息，将newCity对象发过去
    [self.delegate addcityViewController:self didFinishInput:newCity];
    
    [self.navigationController popViewControllerAnimated:YES];
}


@end
