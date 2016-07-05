//
//  NewsNetManager.h
//  BaseProject
//
//  Created by tarena on 15/12/17.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "BaseNetManager.h"

#import "VideoModel.h"



@interface NewsNetManager : BaseNetManager

+ (id)getVideosWithStartIndex:(NSInteger)startIndex kCompletionHandle

@end
