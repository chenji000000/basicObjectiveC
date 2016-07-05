//
//  ViewController.m
//  Demo01-NSArchiving
//
//  Created by tarena on 15/11/7.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic,strong) NSString *archivingFilePath;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Documents/archivingFile
    NSString *documentsPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    self.archivingFilePath=[documentsPath stringByAppendingPathComponent:@"archivingFile"];
}

- (IBAction)archivingNSArrayData:(id)sender {
    //需求：将两个NSArray对象使用归档的方式存到文件
   //准备两个数据对象
    NSArray *firstArray=@[@"Jonny",@19,@[@"Objective-C",@"Ruby"]];
    NSArray *secondArray=@[@"Bob",@"Maggie"];
    //1.准备一个可变的数据对象(空的)
    NSMutableData *data=[NSMutableData data];
    NSLog(@"编码前的数据长度：%lu",(unsigned long)data.length);
    //2.创建NSKeyedArchiver对象
    NSKeyedArchiver *archiver=[[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    //3.对数据进行编码操作（二进制）
    [archiver encodeObject:firstArray forKey:@"firstUser"];
    [archiver encodeObject:secondArray forKey:@"secondUser"];
    //4.执行完成编码操作
    [archiver finishEncoding];
    NSLog(@"编码后的数据长度：%lu",(unsigned long)data.length);
    //5.将完成编码的数据写入文件
    if([data writeToFile:self.archivingFilePath atomically:YES]){
        NSLog(@"写入成功");
    }
}


- (IBAction)unarchivingNSArrayData:(id)sender {
    //需求：从写入的文件中读取数据，验证
    //1.从文件中读取数据（二进制NSData）
    NSData *data=[NSData dataWithContentsOfFile:self.archivingFilePath];
    //2.创建一个NSKeyedUnarchiver对象
    NSKeyedUnarchiver *unarchiver=[[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    //3.对数据进行解码操作(key)
    NSArray *firstArray=[unarchiver decodeObjectForKey:@"firstUser"];
    NSArray *secondArray=[unarchiver decodeObjectForKey:@"secondUser"];
    //4.执行完成解码操作
    [unarchiver finishDecoding];
    //打印验证
    NSLog(@"firstArray:%@;secondArray:%@",firstArray,secondArray);
}














@end
