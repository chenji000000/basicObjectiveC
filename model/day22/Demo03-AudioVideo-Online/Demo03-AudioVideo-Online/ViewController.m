//
//  ViewController.m
//  Demo03-AudioVideo-Online
//
//  Created by tarena on 15/12/1.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *audioVideoControl;
//在线播放音频/视频对象
@property (nonatomic, strong) AVPlayer *player;
//playerLayer对象（显示视频到界面上）
@property (nonatomic, strong) AVPlayerLayer *layer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)clickPlay:(id)sender {
    //判断是哪个segment
    if (self.audioVideoControl.selectedSegmentIndex == 0) {
        //音频
        NSString *audioStr = @"http://fdfs.xmcdn.com/group1/M00/01/3B/wKgDrVCYca7Sf6VzADfjEnQrWdU600.mp3";
        self.player = [AVPlayer playerWithURL:[NSURL URLWithString:audioStr]];
        [self.player play];
    } else {
        //视频
        NSString *videoStr = @"http://flv2.bn.netease.com/videolib3/1510/25/bIHxK3719/SD/bIHxK3719-mobile.mp4";
        self.player = [AVPlayer playerWithURL:[NSURL URLWithString:videoStr]];
        self.layer = [AVPlayerLayer playerLayerWithPlayer:self.player];
        //设置frame
        self.layer.frame = CGRectMake(10, 150, 300, 250);
        //添加到view上
        [self.view.layer addSublayer:self.layer];
        //播放
        [self.player play];
    }
}

- (IBAction)clickPause:(id)sender {
    [self.player pause];
}
//继续播放
- (IBAction)clickCancel:(id)sender {
    [self.player play];
}






@end
