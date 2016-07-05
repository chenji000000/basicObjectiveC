//
//  MyView.m
//  Demo2_绘制字符串
//
//  Created by tarena on 15/10/28.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MyView.h"

@implementation MyView


- (void)drawRect:(CGRect)rect {
    NSString *str=@"Hello WorldHello WorldHello WorldHello WorldHello WorldHello WorldHello WorldHello World结尾";
    
    NSMutableDictionary *attributes=[NSMutableDictionary dictionary];
    attributes[NSFontAttributeName]=[UIFont systemFontOfSize:18];
    attributes[NSForegroundColorAttributeName]=[UIColor redColor];
    
//    [str drawAtPoint:CGPointMake(30, 100) withAttributes:attributes];
    
    //能够根据字符串的内容，在指定宽度的情况下，算出刚好能够刚好装下所有文字的高度
    CGRect strRect=[str boundingRectWithSize:CGSizeMake(200, 999) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
    
    
    //将字符串画在指定的矩形区域内
    
    [str drawInRect:CGRectMake(30, 100, strRect.size.width, strRect.size.height) withAttributes:attributes];
}


@end
