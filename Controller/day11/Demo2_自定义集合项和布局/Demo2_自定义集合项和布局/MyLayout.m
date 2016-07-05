//
//  MyLayout.m
//  Demo2_自定义集合项和布局
//
//  Created by tarena on 15/10/21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MyLayout.h"

@implementation MyLayout

-(instancetype)init
{
    self=[super init];
    if (self) {
        //配置布局的参数信息
        self.itemSize=CGSizeMake(80, 80);
        self.minimumLineSpacing=10;
        self.minimumInteritemSpacing=10;
        self.scrollDirection=UICollectionViewScrollDirectionHorizontal;
        //设置每个section的内边距
        //sectionInset属性为UIEdgeInsets类型的结构体
        self.sectionInset=UIEdgeInsetsMake(154, 30, 154, 30);
    }
    return self;
}

@end
