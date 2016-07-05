//
//  TRHeaderView.m
//  TRWeatherForcast
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "TRHeaderView.h"
#import "UILabel+TRLabel.h"


static CGFloat inset=20;//左右边距
static CGFloat labelHeight=40;//label高
static CGFloat tempLabelHeight=110;//温度Label高

@implementation TRHeaderView

//重写父类的方法，实现添加5个控件的逻辑
- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //城市Label
        CGRect cityLabelRect=CGRectMake(0, inset, frame.size.width, labelHeight);
        self.cityLabel=[UILabel labelWithFrame:cityLabelRect];
        self.cityLabel.text=@"loading...";
        self.cityLabel.textAlignment=NSTextAlignmentCenter;
        
        //加载到视图上
        [self addSubview:self.cityLabel];
        
        //最低最高Label
        CGRect hiloLabelRect=CGRectMake(inset, frame.size.height-labelHeight, frame.size.width-2*inset, labelHeight);
        self.hiloLabel=[UILabel labelWithFrame:hiloLabelRect];
        self.hiloLabel.text=@"0˚ / 10˚";
        
        [self addSubview:self.hiloLabel];
        
        //当前温度
        CGRect tempLabelRect=CGRectMake(inset, frame.size.height-labelHeight-tempLabelHeight, frame.size.width-2*inset, tempLabelHeight);
        self.temperatureLabel=[UILabel labelWithFrame:tempLabelRect];
        self.temperatureLabel.text=@"10˚";
        
        [self addSubview:self.temperatureLabel];
        
        //天气iconView
        CGRect iconViewRect=CGRectMake(inset, tempLabelRect.origin.y-labelHeight, labelHeight, labelHeight);
        self.iconView=[[UIImageView alloc] initWithFrame:iconViewRect];
        self.iconView.image=[UIImage imageNamed:@"placeholder"];
        
        [self addSubview:self.iconView];
        
        //天气描述
        CGRect conditionRect=CGRectMake(inset+labelHeight, iconViewRect.origin.y, frame.size.width-2*inset-labelHeight, labelHeight);
        self.conditionsLabel=[UILabel labelWithFrame:conditionRect];
        self.conditionsLabel.text=@"Sunny";
        
        [self addSubview:self.conditionsLabel];
    }
    return self;
}
@end
