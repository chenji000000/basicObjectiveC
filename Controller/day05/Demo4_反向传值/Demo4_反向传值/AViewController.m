//
//  AViewController.m
//  Demo4_反向传值
//
//  Created by tarena on 15/10/14.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "AViewController.h"
#import "BViewController.h"

@interface AViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation AViewController
//执行时机：只有在视图第一次创建时，执行一次
//如果运行过程中，视图曾经隐藏过，在显示，只要视图不曾销毁
//就不会重建，就不会在执行viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}


//在视图即将显示时执行此方法
//此方法会随着视图的隐藏及显示，而被执行多次
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //将回传回来的值显示到标签上
    self.label.text=self.backValue;
    
}


//点击按钮后，跳转到B界面
- (IBAction)gotoBVC:(id)sender {
    //1.创建bvc的实例
    BViewController *bvc=[[BViewController alloc] initWithNibName:@"BViewController" bundle:nil];
    //2.avc将自己的引用传给要推出的bvc
    //这样，bvc就知道回来的时候要给那个对象传值了
    bvc.backReference=self;
    
    //3.present出新的bvc
    [self presentViewController:bvc animated:YES completion:nil];
    
}


@end
