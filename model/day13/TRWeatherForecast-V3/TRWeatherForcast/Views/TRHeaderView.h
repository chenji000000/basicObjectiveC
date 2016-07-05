//
//  TRHeaderView.h
//  TRWeatherForcast
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TRHeaderView : UIView

//城市
@property (nonatomic,strong) UILabel *cityLabel;
@property (nonatomic,strong) UIImageView *iconView;
//天气情况描述
@property (nonatomic,strong) UILabel *conditionsLabel;
//当天温度
@property (nonatomic,strong) UILabel *temperatureLabel;
//当天最低最高温度
@property (nonatomic,strong) UILabel *hiloLabel;

//提供一个接口（方法）


@end
