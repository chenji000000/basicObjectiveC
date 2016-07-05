//
//  TRPoetryCategoryViewController.m
//  TRPoetry
//
//  Created by tarena on 15/11/27.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "TRPoetryCategoryViewController.h"
#import "Masonry.h"
#import <AVFoundation/AVFoundation.h>


@interface TRPoetryCategoryViewController ()<AVSpeechSynthesizerDelegate>
@property (nonatomic, strong) UITextView *textView;

//朗读Item
@property (nonatomic, strong) UIBarButtonItem *readItem;
//语音合成的对象
@property (nonatomic, strong) AVSpeechSynthesizer *synthesizer;
@end

@implementation TRPoetryCategoryViewController

- (AVSpeechSynthesizer *)synthesizer {
    if (!_synthesizer) {
        _synthesizer = [AVSpeechSynthesizer new];
        _synthesizer.delegate = self;
    }
    return _synthesizer;
}

- (UITextView *)textView
{
    if (!_textView) {
        _textView = [UITextView new];
        _textView.font = [UIFont systemFontOfSize:18];
        //不可编辑
        _textView.editable = NO;
    }
    return _textView;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.textView];
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    self.textView.text = self.poetryCategoryStr;
    self.textView.contentOffset = CGPointMake(0, 0);
    
    //创建readItem并添加
    self.readItem = [[UIBarButtonItem alloc] initWithTitle:@"朗读" style:UIBarButtonItemStyleDone target:self action:@selector(readPoemCategory)];
    self.navigationItem.rightBarButtonItem = self.readItem;
    
}

- (void)readPoemCategory {
    //判定如果正在读, 设置成暂停
    if (self.synthesizer.speaking) {
        [self.synthesizer stopSpeakingAtBoundary:AVSpeechBoundaryWord];
        return;
    }
    //AVSpeechSynthesizer --> 播放动作
    //AVSpeechUtterance --> 设置语言/音调/语速
    //AVSpeechSynthesizerDelegate
    //说话方式对象(指定说的内容)
    AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:self.poetryCategoryStr];
    //设置说话的语言
    utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"zh_CN"];
    //设置音量[0.0 ~ 1.0]
    //    utterance.volume = 1.0;
    //    //设置语速
    //    utterance.rate = 0.1;
    //    //设置语调
    //    utterance.pitchMultiplier = 1.0;
    
    //开始说话
    [self.synthesizer speakUtterance:utterance];
}

#pragma mark --- SpeechDelegate
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didCancelSpeechUtterance:(AVSpeechUtterance *)utterance {
    //监听到暂停的动作
    self.readItem.title = @"朗读";
    
}
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didFinishSpeechUtterance:(AVSpeechUtterance *)utterance {
    //监听到读完`
    self.readItem.title = @"朗读";
    
}
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didStartSpeechUtterance:(AVSpeechUtterance *)utterance {
    //监听到开始读
    self.readItem.title = @"暂停";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
