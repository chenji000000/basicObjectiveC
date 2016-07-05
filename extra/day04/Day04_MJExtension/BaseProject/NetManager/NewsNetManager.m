//
//  NewsNetManager.m
//  BaseProject
//
//  Created by tarena on 15/12/17.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "NewsNetManager.h"
#import "NewsPaths.h"

@implementation NewsNetManager

+ (id)getVideosWithStartIndex:(NSInteger)startIndex completionHandle:(void(^)(id, NSError *))completionHandle;
{
    NSString *path = [NSString stringWithFormat:kVideoPath, startIndex];
    return [self GET:path parameters:nil completionHandle:^(id model, NSError *error) {
//        /** MJExtension 解析方法， 数组和字典是不同的 */
//        //如果model是个字典类型
//        //在最新版本中，下方名称变动mj_objectWithKeyValues
//        VideoModel *mo = [VideoModel objectWithKeyValues:model];
//        //假设 返回值 是数组类型
//        /*
//        mo = [VideoModel objectArrayWithKeyValuesArray:model];
//         */
        
        completionHandle([VideoModel parse:model], error);
    }];
}

@end
