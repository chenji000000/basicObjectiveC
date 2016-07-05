//
//  ViewController.m
//  Demo03-NSFileManager
//
//  Created by tarena on 15/11/5.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//单例对象
@property(nonatomic,strong)NSFileManager *manager;//mgr
// xxxx/Documents/test/路径
@property(nonatomic,strong)NSString *testPath;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化文件管理对象
    self.manager=[NSFileManager defaultManager];
    //初始化/Documents/test/路径
    NSString *documentsPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    self.testPath=[documentsPath stringByAppendingPathComponent:@"test"];
    NSLog(@"test路径:%@",self.testPath);
    
}
- (IBAction)createDirectoryAndTwoFiles:(id)sender {
    //1.直接调用创建文件夹的方法
    /*
     第二个参数：是否需要一个中间的文件夹（YES：允许该文件夹已经存在；NO：不允许该文件夹存在）
     第三个参数（扩展）：指定文件夹的权限（nil：使用默认的权限：rwx:读/写/执行）
     */
    NSError *error=nil;
    [self.manager createDirectoryAtPath:self.testPath withIntermediateDirectories:YES attributes:nil error:&error];
    if (!error) {
        //2.拼接两个路径xxx/Documents/test/test01.txt;test02.txt;
        NSString *firstFilePath=[self.testPath stringByAppendingPathComponent:@"test01.txt"];
        NSString *secondFilePath=[self.testPath stringByAppendingPathComponent:@"test02.txt"];
        //3.创建两个文件(写入内容)
        NSString *firstContent=@"写入第一个文件的测试内容";
        /*
         第二个参数：写入文件的内容（二进制类型）
         第三个参数（扩展）：指定文件的权限（nil：使用默认的文件权限）
         注意：首先会判断文件是否存在，存在，直接写内容；不存在，重新创建，并写入内容
         */
        BOOL isSuccess=[self.manager createFileAtPath:firstFilePath contents:[firstContent dataUsingEncoding:NSUTF8StringEncoding] attributes:nil];
        if (isSuccess) {
            NSLog(@"创建第一个文件成功");
        }
        NSString *secondContent=@"写入第二个文件的测试内容";
        if ([self.manager createFileAtPath:secondFilePath contents:[secondContent dataUsingEncoding:NSUTF8StringEncoding]attributes:nil]) {
            NSLog(@"创建第二个文件成功");
        }
    }
    
}
- (IBAction)getAllFiles:(id)sender {
    //获取/test下面的所有文件（test01.txt;test02.txt）
    NSArray *subPathArray=[self.manager subpathsAtPath:self.testPath];
    for (NSString *subPathStr in subPathArray) {
        NSLog(@"文件的名字:%@",subPathStr);
    }
    
    //方式二：获取test文件夹下面的所有文件
    NSArray *subPathDirArray=[self.manager subpathsOfDirectoryAtPath:self.testPath error:nil];
    for (NSString *subPathStr in subPathDirArray) {
        NSLog(@"方式二获取文件名字:%@",subPathStr);
    }
}
- (IBAction)copyFileContent:(id)sender {
    // /test/test01.txt-->/test/testCopy.text
    //拼接两个文件的绝对路径
    NSString *sourcePath=[self.testPath stringByAppendingPathComponent:@"test01.txt"];
    NSString *targetPath=[self.testPath stringByAppendingPathComponent:@"testCopy.txt"];
    //执行拷贝动作
    NSError *error=nil;
    //自动创建testCopy.txt文件
    BOOL isSuccess=[self.manager copyItemAtPath:sourcePath toPath:targetPath error:&error];
    if (!isSuccess) {
        NSLog(@"拷贝文件内容失败:%@",error.userInfo);
    }
    
}
- (IBAction)deleteFile:(id)sender {
  
    //删除testCopy.txt
    //1.拼接文件的绝对路径
    NSString *copyPath=[self.testPath stringByAppendingPathComponent:@"testCopy.txt"];
    //2.执行删除的动作
    NSError *error=nil;
    if (![self.manager removeItemAtPath:copyPath error:&error]) {
        NSLog(@"删除文件失败:%@",error.userInfo);
    }
}
















@end
