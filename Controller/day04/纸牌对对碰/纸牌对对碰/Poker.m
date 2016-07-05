//
//  Poker.m
//  纸牌对对碰
//
//  Created by tarena on 15/10/13.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "Poker.h"
#import "Card.h"

@implementation Poker

//重写系统提供的allCards属性的getter方法
//目的：什么时候用到数组属性，才为数组分配空间
-(NSMutableArray *)allCards
{
    //!_allCards等价于_allCards==nil;
    if(!_allCards){
        _allCards=[NSMutableArray array];
    }
    return _allCards;

}


//———创建扑克牌实例时，就应该立即准备好52张纸牌对象
//放到allCards数组中
-(instancetype)init
{
    //self等价于self!=nil;
if(self=[super init])
{
    NSArray *allSuit=[Card allSuit];
    NSArray *allRank=[Card allRank];
    //遍历所有花色和大小，进行交叉组合，生成52张纸牌
    //每生成一张纸牌对象，就放入到数组中
    for (NSString *suit in allSuit) {
        for (NSString *rank in allRank) {
            Card *card=[[Card alloc] initWithSuit:suit andRank:rank];
            [self.allCards addObject:card];
        }
    }
}
    return self;
}

@end
