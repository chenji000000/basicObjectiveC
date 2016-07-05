//
//  TRMetaDataTool.m
//  TRSearchDeals
//
//  Created by tarena on 15/11/20.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "TRMetaDataTool.h"
#import "TRCategory.h"
#import "TRCity.h"
#import "TRSort.h"
#import "TRRegion.h"

@implementation TRMetaDataTool

static NSArray *_categoryArray=nil;

+(NSArray *)categories
{
    if (!_categoryArray) {
        _categoryArray=[[self alloc] getAndParseWithPlistFile:@"categories.plist" withClass:[TRCategory class]];
    }
    return _categoryArray;
}



static NSArray *_sortsArray=nil;
+(NSArray *)sorts
{
    if (!_sortsArray) {
        //初始化排序数组
        _sortsArray=[[self alloc] getAndParseWithPlistFile:@"sorts.plist" withClass:[TRSort class]];
    }
    return _sortsArray;
}

static NSArray *_citiesArray=nil;
+(NSArray *)cities
{
    if (!_citiesArray) {
        _citiesArray=[[self alloc] getAndParseWithPlistFile:@"cities.plist" withClass:[TRCity class]];
    }
    return _citiesArray;
}

- (NSArray *)getAndParseWithPlistFile:(NSString *)plistFile withClass:(Class)className
{
    //从plist文件中读取数据(NSArray[NSDictionary...])
    NSString *plistPath=[[NSBundle mainBundle] pathForResource:plistFile ofType:nil];
    NSArray *array=[NSArray arrayWithContentsOfFile:plistPath];
    NSMutableArray *mutableArray=[NSMutableArray array];
    
    for (NSDictionary *dic in array) {
        //创建一个实例变量
        id instance=[[className alloc] init];
        [instance setValuesForKeysWithDictionary:dic];
        [mutableArray addObject:instance];
    }
    return mutableArray;
}

+(NSArray *)regionsByCityName:(NSString *)cityName
{
    
    
}

//keyword:iOS class as paremeter
@end
