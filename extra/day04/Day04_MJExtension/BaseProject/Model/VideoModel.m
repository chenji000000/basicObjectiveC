//
//  VideoModel.m
//  BaseProject
//
//  Created by tarena on 15/12/17.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "VideoModel.h"

@implementation VideoModel


+ (NSDictionary *)objectClassInArray{
    return @{@"videoSidList" : [Videosidlist class], @"videoList" : [Videolist class]};
}


@end


@implementation Videosidlist
/** 通过下方方法更换某些属性对应的key */

//propertyName:属性名
//返回 属性名 所对应的 key
+(NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName
{
    if ([propertyName isEqualToString:@"desc"]) {
        propertyName = @"description";
    }
    return propertyName;
}
@end


@implementation Videolist

@end





