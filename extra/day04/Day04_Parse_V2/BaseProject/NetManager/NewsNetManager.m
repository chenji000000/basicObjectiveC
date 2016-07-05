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
        completionHandle([VideoModel parse:model],error);
    }];
}

@end
