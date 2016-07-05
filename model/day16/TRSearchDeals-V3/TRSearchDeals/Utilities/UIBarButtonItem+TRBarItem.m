//
//  UIBarButtonItem+TRBarItem.m
//  TRSearchDeals
//
//  Created by tarena on 15/11/23.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "UIBarButtonItem+TRBarItem.h"

@implementation UIBarButtonItem (TRBarItem)
+(UIBarButtonItem *)itemWithImageName:(NSString *)imageName withHighlightedImageName:(NSString *)hlImageName withTarget:(id)target withAction:(SEL)action
{
    UIButton *button=[UIButton new];
    [button setImage:[UIImage imageNamed:hlImageName] forState:UIControlStateHighlighted];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    button.frame=CGRectMake(0, 0, 80, 40);
//    button.backgroundColor=[UIColor redColor];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

@end
