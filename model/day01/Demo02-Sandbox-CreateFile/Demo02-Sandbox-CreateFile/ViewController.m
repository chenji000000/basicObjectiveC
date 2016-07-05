//
//  ViewController.m
//  Demo02-Sandbox-CreateFile
//
//  Created by tarena on 15/11/5.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong)NSString *documentsPath;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //获取沙盒中Documents路径
    self.documentsPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSLog(@"Documents路径：%@",self.documentsPath);
}

- (IBAction)createFileByNSString:(id)sender {
    //拼接写入文件的绝对路径：xxx/Documents/testFileStr.txt
    NSString *filePath=[self.documentsPath stringByAppendingPathComponent:@"testFileStr.txt"];
    //给定一个NSString对象，直接写入文件
    NSString *contentStr=@"测试内容";
    /*
     第一个参数：写入文件的路径
     第二个参数：指定是否是原子(YES:再生成一个辅助文件，帮助最终是否能写成功；NO:没有中间的辅助文件)
     第三个参数：指定编码方式
     第四个参数：指定一个错误对象
     
     */
    NSError *error=nil;
    BOOL isSuccess=[contentStr writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:&error];
    if (!isSuccess) {
        //userInfo：显示更多更详细的错误信息
        NSLog(@"写入文件失败：%@",error.userInfo);
    }
}

- (IBAction)createFileByNSArray:(id)sender {
    //拼接文件路径
    NSString *filePath=[self.documentsPath stringByAppendingPathComponent:@"testFileArray.txt"];
    //声明数组对象，写入指定文件中
    NSArray *array=@[@"测试内容",@20,@[@"testcontent",@30]];
    //注意：自动的创建文件；将内容写入文件中
    BOOL isSuccess=[array writeToFile:filePath atomically:YES];
    if (!isSuccess) {
        NSLog(@"将数组数据写入文件失败");
    }
}

- (IBAction)createFileByDictionary:(id)sender {
    NSString *filePath=[self.documentsPath stringByAppendingPathComponent:@"testFileDic.txt"];
    NSDictionary *dictionary=@{@"1":@"test1",@"2":@"test2"};
    BOOL isSuccess=[dictionary writeToFile:filePath atomically:YES];
    if (!isSuccess) {
        NSLog(@"将字典对象写入文件失败");
    }
    
}












@end
