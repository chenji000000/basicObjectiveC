//
//  Game.h
//  纸牌对对碰
//
//  Created by tarena on 15/10/13.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Poker.h"

/*
 Game：游戏类
 作用：
 1.在游戏开始时，能够依靠指定的扑克牌，随机抽取出所需的纸牌
 2.在点击某张牌时，根据业务原则进行比对
 
 属性：
 1.为了存储随机出来的纸牌，有一个可变数组 allRandomCards
 
 
 */
@interface Game : NSObject

//记录分数的属性
@property(nonatomic)NSInteger score;

@property(nonatomic,strong) NSMutableArray *allRandomCards;

//纸牌从哪抽取？
//抽取几张？
//依靠传入的poker和count，决定当游戏开始时
//在那个对象中，抽取多少张牌
-(instancetype)initWithPoker:(Poker *)poker forCardCount:(NSInteger)cardsCount;
//核心业务逻辑：根据传入的点击位置，进行比对
-(void)tapCardAtIndex:(NSInteger)index;


@end
