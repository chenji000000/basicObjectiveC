//
//  Poker.h
//  纸牌对对碰
//
//  Created by tarena on 15/10/13.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 Poker:一副扑克牌类
 作用：能够存储52张标准的card对象即可
 属性：NSMutableArray allCards
 
 */
@interface Poker : NSObject

@property(nonatomic,strong) NSMutableArray *allCards;

@end
