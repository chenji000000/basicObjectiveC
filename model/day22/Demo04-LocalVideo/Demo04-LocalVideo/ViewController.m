//
//  ViewController.m
//  Demo04-LocalVideo
//
//  Created by tarena on 15/12/1.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

@interface ViewController ()
@property (nonatomic, strong) AVPlayerViewController *controller;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

- (IBAction)startPlayLocalVideo:(id)sender {
    //本地url
    NSURL *videoURL = [[NSBundle mainBundle] URLForResource:@"广告" withExtension:@"mov"];
    //controller对象
    self.controller = [[AVPlayerViewController alloc] init];
    self.controller.player =[AVPlayer playerWithURL:videoURL];
    //显示
    [self presentViewController:self.controller animated:YES completion:nil];
}


@end
