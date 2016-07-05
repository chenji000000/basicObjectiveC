//
//  ViewController.m
//  Demo03-Plist
//
//  Created by tarena on 15/11/6.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong)NSString *testPath;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *documentsPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    self.testPath=[documentsPath stringByAppendingPathComponent:@"test.plist"];
}
//手动创建plist文件
- (IBAction)getPlistData:(id)sender {
    //1.获取手动创建的plist文件的路径
    NSString *plistPath=[[NSBundle mainBundle] pathForResource:@"student" ofType:@"plist"];
    //2.根据plist文件root的type类型，使用不同的类型来接收数据（NSArray/NSDictionary）
    NSArray *plistArray=[[NSArray alloc] initWithContentsOfFile:plistPath];
    //验证数组的数据
    for (NSDictionary *studentDic in plistArray) {
        NSString *name=[studentDic objectForKey:@"name"];
        NSNumber *age=[studentDic objectForKey:@"age"];
        NSLog(@"name:%@;age:%@",name,age);
    }
    
}
- (IBAction)writeDataToPlist:(id)sender {
    //需求：字典类型数据写入plist文件中（沙盒/Documents/test.plist）
    NSDictionary *dic=@{@"names":@[@"Maggie",@"Jonny"]};
    if([dic writeToFile:self.testPath atomically:YES])
    {
        NSLog(@"写入成功");
    }
}

- (IBAction)readDataFromPlist:(id)sender {
    //从plist文件中读取数据，确定plist文件root的类型type
    NSDictionary *dic=[[NSDictionary alloc] initWithContentsOfFile:self.testPath];
    NSLog(@"读取数据:%@",dic);
}














@end
