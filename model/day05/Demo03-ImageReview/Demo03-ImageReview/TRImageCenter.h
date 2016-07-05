//
//  TRImageCenter.h
//  Demo03-ImageReview
//
//  Created by tarena on 15/11/10.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRImageCenter : NSObject

//可变字典
@property(nonatomic,strong) NSMutableDictionary *cachesMutableDic;
//返回单例对象的接口
+(id)sharedImageCenter;
@end
