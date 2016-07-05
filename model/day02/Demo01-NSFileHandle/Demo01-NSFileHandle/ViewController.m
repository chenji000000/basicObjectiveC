//
//  ViewController.m
//  Demo01-NSFileHandle
//
//  Created by tarena on 15/11/6.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic,strong)NSFileManager *manager;
@property(nonatomic,strong)NSString *filePath;
@property(nonatomic,strong)NSString *documentsPath;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //获取Documents路径
    self.documentsPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    //拼接文件路径
    self.filePath=[self.documentsPath stringByAppendingPathComponent:@"fileHandle.txt"];
    self.manager=[NSFileManager defaultManager];
}
- (IBAction)writeContentToFile:(id)sender {
    //1.创建一个空的文件
    BOOL isSuccess=[self.manager createFileAtPath:self.filePath contents:nil attributes:nil];
    if (isSuccess) {
        //2.创建NSFileHandle对象
        //3.指定文件句柄的写句柄
        NSFileHandle *handle=[NSFileHandle fileHandleForWritingAtPath:self.filePath];
        NSString *content=@"使用NSFileHandle写入测试内容";
        NSData *fileData=[content dataUsingEncoding:NSUTF8StringEncoding];
        [handle writeData:fileData];
        
        //4.关闭文件句柄对象
        [handle closeFile];
    }
    
}

- (IBAction)copySmallFile:(id)sender {
    //1.已知：fileHandle.txt源文件；创建一个目标文件（target.txt）
    NSString *targetPath=[self.documentsPath stringByAppendingPathComponent:@"target.txt"];
    BOOL isSuccess=[self.manager createFileAtPath:targetPath contents:nil attributes:nil];
    if (isSuccess) {
        //2.创建两个文件句柄对象（源文件：读句柄；目标文件：写句柄）
        NSFileHandle *readHandle=[NSFileHandle fileHandleForReadingAtPath:self.filePath];
        NSFileHandle *writeHandle=[NSFileHandle fileHandleForWritingAtPath:targetPath];
        //3.执行真正的拷贝动作
        NSData *readData=[readHandle readDataToEndOfFile];
        [writeHandle writeData:readData];
        //4.关闭两个句柄对象
        [readHandle closeFile];
        [writeHandle closeFile];
    }
    
}

- (IBAction)copyBigFile:(id)sender {
    /*需求：将一个大的文件拷贝到目标文件中
     前提：有一个大的文件在/Documents/bigFile.pdf
    */
    //准备工作
    NSString *sourcePath=[self.documentsPath stringByAppendingPathComponent:@"bigFile.pdf"];
    //1.创建一个空的目标文件bigFileBak.pdf
    NSString *targetPath=[self.documentsPath stringByAppendingPathComponent:@"bigFileBak.pdf"];
    BOOL isSuccess=[self.manager createFileAtPath:targetPath contents:nil attributes:nil];
    if (isSuccess) {
        //2.创建两个文件句柄（源：读句柄；目标：写句柄）
        NSFileHandle *readHandle=[NSFileHandle fileHandleForReadingAtPath:sourcePath];
        NSFileHandle *writeHandle=[NSFileHandle fileHandleForWritingAtPath:targetPath];
        //3.从原文件中读数据；写到目标文件中
        //3.1循环读取源文件的数据
        //3.2判断是不是指定读取数据大小的整数倍
        //3.3文件总长度
        NSError *error=nil;
        NSDictionary *sourceFileDic=[self.manager attributesOfItemAtPath:sourcePath error:&error];
        NSLog(@"文件的属性：%@",sourceFileDic);
        NSNumber *fileSizeNumber=[sourceFileDic objectForKey:NSFileSize];
        NSInteger fileTotalSize=[fileSizeNumber longValue];
        //声明几个常量
        NSInteger readSizePerTime=5000;//每次读取数据大小（bytes）
        NSInteger readSize=0;//已经读取数据大小
//        BOOL isEnd=YES;//是否循环结束
      //循环读取数据
    for (int i=0;  i<fileTotalSize/readSizePerTime; i++) {
        
    NSData *readFileData=[readHandle readDataOfLength:readSizePerTime];
        readSize+=readSizePerTime;
    [readHandle seekToFileOffset:readSize];
    [writeHandle writeData:readFileData];
        NSInteger leftSize=fileTotalSize-readSize;
        if (leftSize<readSizePerTime) {
            NSData *readFileData=[readHandle readDataToEndOfFile];
            [writeHandle writeData:readFileData];
        }
                        }
        
    
    
        
        
//        while (isEnd) {
//            //还剩余没有读取的数据大小
//            NSInteger leftSize=fileTotalSize-readSize;
//            
//            if (leftSize<readSizePerTime) {
//                //情况一：不足5000
//                NSData *readFileData=[readHandle readDataToEndOfFile];
//                //写入目标文件
//                [writeHandle writeData:readFileData];
//                //设置while退出的条件
//                isEnd=NO;
//            }
//            else{
//            //情况二：5000整数倍
//                //读取/设置readSize/挪动文件句柄
//                NSData *readFileData=[readHandle readDataOfLength:readSizePerTime];
//                readSize+=readSizePerTime;
//                [readHandle seekToFileOffset:readSize];
//                //写到目标文件中
//                [writeHandle writeData:readFileData];
//            }
//        }
        
        //4.关闭两个文件句柄
        [readHandle closeFile];
        [writeHandle closeFile];
    }
    
}














@end
