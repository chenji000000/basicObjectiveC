//
//  ViewController.m
//  Demo02-Audio-Background
//
//  Created by tarena on 15/12/1.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
@property (nonatomic, strong) AVAudioSession *session;
@property (nonatomic, strong) AVAudioPlayer *player;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.创建AVAudioSession
   self.session = [AVAudioSession sharedInstance];
    //建议激活session
    [self.session setActive:YES error:nil];
    [self.session setCategory:AVAudioSessionCategoryPlayback error:nil];
    //2.创建AVAudioPlayer
    NSURL *audioFileURL = [[NSBundle mainBundle] URLForResource:@"AllOfMe" withExtension:@"mp3"];
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:audioFileURL error:nil];
    //3.播放
    [self.player play];
}


@end
