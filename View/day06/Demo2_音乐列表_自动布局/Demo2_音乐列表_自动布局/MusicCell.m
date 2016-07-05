//
//  MusicCell.m
//  Demo2_音乐播放列表
//
//  Created by tarena on 15/10/23.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MusicCell.h"

@interface MusicCell()
@property (weak, nonatomic) IBOutlet UILabel *NameLabel;
@property (weak, nonatomic) IBOutlet UILabel *ArtistLabel;
@property (weak, nonatomic) IBOutlet UILabel *DurationLabel;
@property (weak, nonatomic) IBOutlet UIImageView *downloadImageView;
@property (weak, nonatomic) IBOutlet UIImageView *hqImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *hqLeftConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *artistLeftConstraint;



@end

@implementation MusicCell


-(void)setMusic:(TRMusic *)music
{
    _music=music;
    self.NameLabel.text=music.name;
    self.ArtistLabel.text=[[music.artist stringByAppendingString:@" - "] stringByAppendingString:music.album];
    self.DurationLabel.text=[NSString stringWithFormat:@"%d:%02d",(int)music.duration/60,(int)music.duration%60];
    //music  download        YES
    //cell imageView hidden  NO
    self.downloadImageView.hidden=!music.downloaded;
    self.hqImageView.hidden=!music.highQuality;

}
//UIView自己内部的子视图的布局，要写在UIView的layoutSubViews方法中，所以在此方法中，根据hq和download属性来修改hq和艺术家名称label的左边距约束
-(void)layoutSubviews
{
//先保留父类中已经做好的布局
    [super layoutSubviews];
    
    //x用于存放第一个可占中的位置
    CGFloat x=25;
    if (self.music.downloaded) {
        x+=20;
    }
//如果音乐是高清版，则x就是hq的位置
    if (self.music.highQuality) {
        
        self.hqLeftConstraint.constant=x;
        //计算下一个可用的位置
        x+=20;
    }
    self.artistLeftConstraint.constant=x;
    
}

@end
