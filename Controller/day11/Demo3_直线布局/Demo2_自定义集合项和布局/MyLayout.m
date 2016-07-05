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
        self.itemSize=CGSizeMake(200, 200);
        self.minimumLineSpacing=50;
        self.minimumInteritemSpacing=10;
        self.scrollDirection=UICollectionViewScrollDirectionHorizontal;
        //设置每个section的内边距
        //sectionInset属性为UIEdgeInsets类型的结构体
        self.sectionInset=UIEdgeInsetsMake(60, 0, 60, 0);
    }
    return self;
    
    
}
//设置在修改attribute对象时，是否有效
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;

}

-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    //将系统中已经生成好的了控制item
    //显示的那一堆UICollectionViewLayoutAttributes取出来
    NSArray *allAttributes=[super layoutAttributesForElementsInRect:rect];
    
    //根据滚动的位置，修改数组中
    //每一个UICollectionViewLayoutAttributes对象里面，跟大小有关的scale属性
    
    //1.获取可见区域的那个绿色框
    CGRect greenRect;
    greenRect.origin=self.collectionView.contentOffset;
    greenRect.size=self.collectionView.bounds.size;
    //2.计算绿色框的那个绿色中心线
    CGFloat greenCenter=CGRectGetMidX(greenRect);
    
    //3.遍历每一个项的中心线
    //判断红线与绿线之间的间距，依据这个不断变化的间距，生成一个可变的scale数值，使用这个scale来修改布局信息，scale的变化范围（1~1.5）
    for (UICollectionViewLayoutAttributes *attr in allAttributes) {
        //红线
        CGFloat redCenter=attr.center.x;
        //计算红线与绿线之间的间距
        CGFloat distance=greenCenter-redCenter;
       //zoom：1~0
        CGFloat zoom=distance/200;
        //ABS()取绝对值
        if (ABS(distance)<=200) {
            //当distance为200时，scale为1，当distance为0时，scale为1.5
            CGFloat scale=1+0.5*(1-ABS(zoom));
            //CATransform3DMakeScale(x,y,z)
            attr.transform3D=CATransform3DMakeScale(scale, scale, 1)       ;
        }
    }
    //返回改完的这一组对象
    return allAttributes;
}



@end
