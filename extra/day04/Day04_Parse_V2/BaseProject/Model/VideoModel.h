//
//  VideoModel.h
//  BaseProject
//
//  Created by tarena on 15/12/17.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "BaseModel.h"

/*
 1.遇到字典则新建类型
 2.解析的实现 由底层 向上
 */

/*
 ESJsonFormat插件的使用
 window->ESJsonFormat-> input Json
 1.生成时,会弹出输入框,要求输入即将生成的类的类名
 2.生成以后,要查看生成的属性,修改系统关键字
 
 */

//http://c.m.163.com/nc/video/home/1-10.html


@class Videosidlist,Videolist;
@interface VideoModel : BaseModel

@property (nonatomic, copy) NSString *videoHomeSid;

@property (nonatomic, strong) NSArray<Videosidlist *> *videoSidList;

@property (nonatomic, strong) NSArray<Videolist *> *videoList;

//+ (id)parse:(NSDictionary *)responseObj;


@end

@interface Videosidlist : NSObject

@property (nonatomic, copy) NSString *sid;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *imgsrc;
//把传入的字典转换为 Videosidlist类型对象
//+ (id)parse:(NSDictionary *)responseObj;

@end

@interface Videolist : NSObject
//description-->desc

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, copy) NSString *replyid;

@property (nonatomic, copy) NSString *mp4_url;

@property (nonatomic, assign) NSInteger playCount;

@property (nonatomic, copy) NSString *replyBoard;

@property (nonatomic, copy) NSString *vid;

@property (nonatomic, assign) NSInteger length;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *m3u8Hd_url;

@property (nonatomic, copy) NSString *ptime;

@property (nonatomic, copy) NSString *cover;

@property (nonatomic, copy) NSString *videosource;

@property (nonatomic, copy) NSString *mp4Hd_url;

@property (nonatomic, assign) NSInteger playersize;

@property (nonatomic, assign) NSInteger replyCount;

@property (nonatomic, copy) NSString *m3u8_url;

//+ (id)parse:(NSDictionary *)responseObj;

@end

