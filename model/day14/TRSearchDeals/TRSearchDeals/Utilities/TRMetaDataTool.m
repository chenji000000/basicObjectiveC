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

@implementation TRMetaDataTool

static NSArray *_categoryArray=nil;

+(NSArray *)categories
{
    if (!_categoryArray) {
        _categoryArray=[[self alloc] getAndParseCategory:@"categories.plist"];
    }
    return _categoryArray;
}

-(NSArray *)getAndParseCategory:(NSString *)plistFile
{
    //从plist文件中读取数据(NSArray[NSDictionary...])
    NSString *filePath=[[NSBundle mainBundle] pathForResource:plistFile ofType:nil];
    NSArray *array=[NSArray arrayWithContentsOfFile:filePath];
    //将数组中的字典类型转换成TRCategory
    NSMutableArray *categoryMutableArray=[NSMutableArray array];
    for (NSDictionary *categoryDic in array) {
        TRCategory *category=[TRCategory new];
        [category setValuesForKeysWithDictionary:categoryDic];
        [categoryMutableArray addObject:category];
    }
    return [categoryMutableArray copy];
}

@end
