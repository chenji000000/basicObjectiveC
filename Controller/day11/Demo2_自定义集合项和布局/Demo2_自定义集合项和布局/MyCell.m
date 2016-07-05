//
//  MyCell.m
//  Demo2_自定义集合项和布局
//
//  Created by tarena on 15/10/21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MyCell.h"

@interface MyCell()

@property(nonatomic,strong)UIImageView *bgImageView;
@property(nonatomic,strong) UILabel *textLabel;

@end

@implementation MyCell

//因为系统自动创建Cell实例时，调用initWithFrame方法，所以，重写该方法，在创建Cell时，将Cell内可包含的子视图也创建好
-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        //创建背景视图
        UIImageView *bgImageView=[[UIImageView alloc] init];
       self.bgImageView=bgImageView;
        
        self.backgroundView=bgImageView;
        
        //创建内容标签
        UILabel *label=[[UILabel alloc] init];
        self.textLabel=label;
        label.frame=CGRectMake(0, 0, frame.size.width, frame.size.height);
        label.font=[UIFont systemFontOfSize:30];
        label.textColor=[UIColor redColor];
        label.textAlignment=NSTextAlignmentCenter;
//        label.text=self.content;
        
        
        [self.contentView addSubview:label];
        
    }
    return self;
}

-(void)setBgImageName:(NSString *)bgImageName
{
    _bgImageName=bgImageName;
    
    self.bgImageView.image=[UIImage imageNamed:bgImageName];

}

-(void)setContent:(NSString *)content
{
    _content=content;
    self.textLabel.text=content;

}

@end
