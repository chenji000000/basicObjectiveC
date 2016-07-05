//
//  News.h
//  Demo5_新闻客户端
//
//  Created by tarena on 15/10/19.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
/*News:新闻类，存储新闻数据*/
@interface News : NSObject
/*图片名称*/
@property(nonatomic,strong) NSString *imageName;
/*新闻标题*/
@property(nonatomic,strong) NSString *title;
/*新闻评论数*/
@property(nonatomic) NSInteger commentNumber;

+(NSArray *)demoData;
@end
