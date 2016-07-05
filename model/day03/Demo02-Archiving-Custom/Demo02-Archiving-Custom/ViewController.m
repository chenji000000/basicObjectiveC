//
//  ViewController.m
//  Demo02-Archiving-Custom
//
//  Created by tarena on 15/11/7.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()
@property(nonatomic,strong)NSString *archivingFilePath;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.拼接归档文件的路径/Documents/archivingFile
    NSString *documentsPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    self.archivingFilePath=[documentsPath stringByAppendingPathComponent:@"archivingFile"];
    
    
    //2.归档操作（写）1~5
    //准备对象
    Person *firstPerson=[[Person alloc] initWithName:@"Jonny" WithAge:18];
    Person *secondPerson=[[Person alloc] initWithName:@"Maggie" WithAge:19];
    //2.1创建可变的数据对象
    NSMutableData *data=[NSMutableData data];
    //2.2创建NSKeyedArchiver对象
    NSKeyedArchiver *archiver=[[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    //2.3对数据进行编码
    [archiver encodeObject:firstPerson forKey:@"firstPerson"];
    [archiver encodeObject:secondPerson forKey:@"secondPerson"];
    //2.4执行完成编码
    [archiver finishEncoding];
    //2.5写入文件
    [data writeToFile:self.archivingFilePath atomically:YES];
    
    
    //3.解档操作（读）1~4
    //3.1读取数据
    NSData *dataDec=[NSData dataWithContentsOfFile:self.archivingFilePath];
    //3.2创建NSKeyedUnarchiver对象
    NSKeyedUnarchiver *unarchiver=[[NSKeyedUnarchiver alloc] initForReadingWithData:dataDec];
    //3.3对数据进行解码
    Person *firstPersonDec=[unarchiver decodeObjectForKey:@"firstPerson"];
    Person *secondPersonDec=[unarchiver decodeObjectForKey:@"secondPerson"];
    //3.4执行完成解码
    [unarchiver finishDecoding];
    //验证数据
    NSLog(@"first person name:%@,age:%ld",firstPersonDec.name,(long)firstPersonDec.age);
    NSLog(@"second person name:%@,age:%ld",secondPersonDec.name,(long)secondPersonDec.age);
    
}



@end
