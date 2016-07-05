//
//  News.m
//  Demo5_新闻客户端
//
//  Created by tarena on 15/10/19.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "News.h"

@implementation News
+(NSArray *)demoData
{
    News *n1=[[News alloc] init];
    n1.imageName=@"n1.png";
    n1.title=@"标题一恢复得十分肯定积分等级分";
    n1.commentNumber=1200;
    
    News *n2=[[News alloc] init];
    n2.imageName=@"n2.png";
    n2.title=@"标题二的覅记得发货京东方";
    n2.commentNumber=1300;
    
    News *n3=[[News alloc] init];
    n3.imageName=@"n3.png";
    n3.title=@"标题三很费劲的回访客户的飞";
    n3.commentNumber=1400;
    
    News *n4=[[News alloc] init];
    n4.imageName=@"n4.png";
    n4.title=@"标题四放多久发货快点飞";
    n4.commentNumber=1500;
    
    News *n5=[[News alloc] init];
    n5.imageName=@"n5.png";
    n5.title=@"标题五大家快放假的发挥";
    n5.commentNumber=1600;
    
    News *n6=[[News alloc] init];
    n6.imageName=@"n6.png";
    n6.title=@"标题六飞机的飞机等级";
    n6.commentNumber=1700;
    
    News *n7=[[News alloc] init];
    n7.imageName=@"n7.png";
    n7.title=@"标题七恢复健康的健康的";
    n7.commentNumber=1800;
    
    News *n8=[[News alloc] init];
    n8.imageName=@"n8.png";
    n8.title=@"标题八发货就快点交罚款";
    n8.commentNumber=1900;
    
    
    return @[n1,n2,n3,n4,n5,n6,n7,n8];


}

@end
