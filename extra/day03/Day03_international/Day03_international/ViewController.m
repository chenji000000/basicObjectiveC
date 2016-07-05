//
//  ViewController.m
//  Day03_international
//
//  Created by tarena on 15/12/16.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 100, 100)];
    [self.view addSubview:label];
    label.font = [UIFont systemFontOfSize:35];
    label.textColor = [UIColor blackColor];
    
    //从File.strings文件中，获取Hello，这个key所对应的值，把值显示在标签上，根据中引文环境，来选择不同的文件。。。
    label.text = NSLocalizedStringFromTable(@"hello", @"File", nil);
    //特殊文件名，Localizable.strings
    label.text = NSLocalizedString(@"name", nil);
    //定义 国际化图片：两张图片，中文环境显示A，英文环境显示B
#warning 如果安装了KSImage 那个插件 imageNamed方法将不出现代码提示
    NSString *imageName = NSLocalizedString(@"imageName", nil);
    UIImage *image = [UIImage imageNamed:imageName];
    
    //国际化应用程序的桌面名称，国际化info.plist文件，新建一个InfoPlist.strings文件
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
