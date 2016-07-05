//
//  NewsCell.m
//  Demo1_自定义单元格_改良版
//
//  Created by tarena on 15/10/20.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "NewsCell.h"

@interface NewsCell ()
@property (weak, nonatomic) IBOutlet UIImageView *NewsImageView;
@property (weak, nonatomic) IBOutlet UILabel *NewsLabel;
@property (weak, nonatomic) IBOutlet UILabel *CommentNumberLabel;

@end

@implementation NewsCell

//只要News属性中，有了数据，就要将数据显示到View中的各个子视图上，当某属性有数据时，执行的是赋值操作，为了捕获这个时机，通过重写set方法
-(void)setNews:(News *)news
{
    _news=news;
    
    //将News中的各个属性值显示到子视图上
    self.NewsImageView.image=[UIImage imageNamed:news.imageName];
    self.NewsLabel.text=news.title;
    self.CommentNumberLabel.text=[NSString stringWithFormat:@"%ld",news.commentNumber];
}








@end
