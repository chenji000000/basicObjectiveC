//
//  Card.h
//  纸牌对对碰
//
//  Created by tarena on 15/10/13.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 card:纸牌类，用于描述游戏的最小单元，一张纸牌
 属性：
 花色：suit
 大小：rank
 面是否朝上 faceUp
 是否已匹配 matched
 
 */
@interface Card : NSObject
@property(nonatomic,strong) NSString*suit;
@property(nonatomic,strong) NSString *rank;
//增加一个属性，用于存储牌面信息（花色+大小）
//增加此属性的目的,是为了方便外界访问花色和大小信息
@property(nonatomic,strong,readonly) NSString *cardInfo;

@property(nonatomic,getter=isFaceUp) BOOL faceUp;
@property(nonatomic,getter=isMatched) BOOL matched;


-(instancetype)initWithSuit:(NSString*)suit andRank:(NSString*)rank;

//为了限定合法的花色和大小，准备两个类方法
//两个类方法分别返回合法的花色和大小

+(NSArray *)allSuit;
+(NSArray *)allRank;




@end
