//
//  ProgressViewController.m
//  Demo1_其他控件
//
//  Created by tarena on 15/10/26.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ProgressViewController.h"

@interface ProgressViewController ()
@property (weak, nonatomic) IBOutlet UIProgressView *downloadView;

@end

@implementation ProgressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.创建并启动定时器
    NSTimer *timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(changeValue:) userInfo:nil repeats:YES];
    
    
}
-(void)changeValue:(NSTimer *)timer
{
//每隔一秒钟，修改progress进度值+0.1
    self.downloadView.progress+=0.1;
    if (self.downloadView.progress==1.0) {
        [timer invalidate];
        NSLog(@"timer stop");
    }

}

@end
