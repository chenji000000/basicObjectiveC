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

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
