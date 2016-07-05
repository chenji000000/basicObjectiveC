//
//  ViewController.m
//  Demo02-NSUserDefaults
//
//  Created by tarena on 15/11/6.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)saveData:(id)sender {
    //1.获取NSUserDefaults单例对象
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    //2.用单例对象选择不同的方法存储数据(自动的创建一个文件)
    [defaults setBool:YES forKey:@"logIn"];
    [defaults setInteger:1 forKey:@"count"];
    NSArray *array=@[@"Maggie",@"Jonny"];
    [defaults setObject:array forKey:@"userArray"];
    
    //3.强制调用写入的方法（不会马上将数据写入文件中）
    [defaults synchronize];//同步
}

- (IBAction)loadData:(id)sender {
    //获取NSUserDefaults单例对象
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    //用单例对象读取文件中的某些值
    NSString *content=[NSString stringWithFormat:@"logIn:%d;count:%ld;array:%@",[defaults boolForKey:@"logIn"],(long)[defaults integerForKey:@"count"],[defaults arrayForKey:@"userArray"]];
    //显示读取的数据到UITextView上
    self.textView.text=content;
}

- (IBAction)removeData:(id)sender {
    //获取NSUserDefaults单例对象
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    //使用单例对象移除数据（不会删除文件）
    [defaults removeObjectForKey:@"logIn"];
    [defaults removeObjectForKey:@"count"];
    [defaults removeObjectForKey:@"userArray"];
}













@end
