//
//  NewsCell.m
//  Demo1_新闻客户端
//
//  Created by tarena on 15/10/23.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "NewsCell.h"


@interface NewsCell()

@property (weak, nonatomic) IBOutlet UIImageView *NewsImageView;
@property (weak, nonatomic) IBOutlet UILabel *TitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *CommentNumLabel;


@end

@implementation NewsCell



-(void)setNews:(News *)news
{
    _news=news;
    
    self.NewsImageView.image=[UIImage imageNamed:news.imageName];
    self.TitleLabel.text=news.title;
    self.CommentNumLabel.text=[NSString stringWithFormat:@"%ld",news.commentNumber];

}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
