//
//  ViewController.m
//  Demo01-LocalAudio
//
//  Created by tarena on 15/12/1.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
//SystemSoundID
@property (nonatomic,assign) SystemSoundID systemID;
//AVAudioPlayer
@property (nonatomic, strong) AVAudioPlayer *player;

@end

@implementation ViewController

- (AVAudioPlayer *)player{
    if (!_player) {
        //本地音频文件对应的URL
        NSURL *audioURL = [[NSBundle mainBundle] URLForResource:@"AllOfMe" withExtension:@"mp3"];
        _player = [[AVAudioPlayer alloc] initWithContentsOfURL:audioURL error:nil];
    }
    return _player;
}

- (IBAction)playShortAudio:(id)sender {
    //播放音效
    //1.获取音效所在路径
    NSString *shortAudioPath = [[NSBundle mainBundle] pathForResource:@"audio" ofType:@"wav"];
    NSURL *shortURL = [NSURL fileURLWithPath:shortAudioPath];
    //2.创建systemSoundID对象
    AudioServicesCreateSystemSoundID((__bridge CFURLRef _Nonnull)(shortURL), &_systemID);
    //3.播放音效
    AudioServicesPlaySystemSound(_systemID);
}

- (IBAction)playLocalAudio:(id)sender {
    //播放本地音频
    //1.获取音频文件的路径
    //2.创建AVAudioPlayer对象（只能播放本地）
    //3.播放音频
    [self.player play];
}

- (IBAction)pauseLocalAudio:(id)sender {
    //如果正在播放，就暂停
    if (self.player.playing) {
        [self.player pause];
    }
}

- (IBAction)cancelLocalAudio:(id)sender {
    //取消播放
    [self.player stop];
    self.player = nil;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
