//
//  UILabel+TRLabel.m
//  TRWeatherForcast
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "UILabel+TRLabel.h"

@implementation UILabel (TRLabel)

+(UILabel *)labelWithFrame:(CGRect)frame
{
    UILabel *label=[[UILabel alloc] initWithFrame:frame];
    label.textColor=[UIColor whiteColor];
    label.textAlignment=NSTextAlignmentLeft;
    //www.iosfonts.com
    label.font=[UIFont fontWithName:@"HelveticalNeue-Light" size:28];
    
    return label;
}
@end
