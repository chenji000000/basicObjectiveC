//
//  Game.m
//  纸牌对对碰
//
//  Created by tarena on 15/10/13.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "Game.h"
#import "Card.h"

@implementation Game

//重写allRandomCards的getter方法，保证在使用数组时
//空间存在
-(NSMutableArray *)allRandomCards
{
    if(!_allRandomCards){
        _allRandomCards=[NSMutableArray array];
    }
    return _allRandomCards;
}


/*
 参数1：poker 要抽取的纸牌的来源
 参数2：cardsCount 要抽取的纸牌的个数
 */

-(instancetype)initWithPoker:(Poker *)poker forCardCount:(NSInteger)cardsCount
{
if(self=[super init])
{
//随机抽取纸牌
    for(int i=0;i<cardsCount;i++)
    {
    //1.先随机出一个下标
        //allCards.count代表的是扑克牌中一共有多少张纸牌
        NSInteger index=arc4random()%poker.allCards.count;
    //2.按照这个下标，到poker中找到这个位置的纸牌
        Card *card=poker.allCards[index];
    //将随机到的这张牌从poker中移除
        [poker.allCards removeObjectAtIndex:index];
    // 3.将这张牌放到用于保存随机牌的allRandCards数组中
        [self.allRandomCards addObject:card];
    }
    
    
}
    return self;
}
/*
 1.根据点击的位置，找到对应的纸牌对象
 2.如果这张牌，面朝上，那么就翻下来
 3.否则，面朝下
    a.先将牌翻成面朝上
     b.将本张牌与剩下的，已经翻上来，且，没有被匹配的进行比对
        1>如果花色相同
          两张牌修改为已经被匹配
        2>否则，如果，大小相同
          两张牌修改为已经被匹配
        3>否则
          将被比较的那张牌翻成背朝上
 
 
 */
-(void)tapCardAtIndex:(NSInteger)index
{
    
    Card *chooseCard=self.allRandomCards[index];
    if(chooseCard.isFaceUp){
        chooseCard.faceUp=NO;
    }else{
        chooseCard.faceUp=YES;
        for(int i=0;i<self.allRandomCards.count;i++){
            if(i!=index){
                Card *otherCard=self.allRandomCards[i];
                if(otherCard.isFaceUp&&!otherCard.isMatched){
                    if([chooseCard.suit isEqualToString:otherCard.suit]){
                        chooseCard.matched=YES;

                        otherCard.matched=YES;
                        //花色相同计1分
                        self.score+=1;
                    }else if ([chooseCard.rank isEqualToString:otherCard.rank]){
                        chooseCard.matched=YES;
                        
                        otherCard.matched=YES;
                        //大小相同计4分
                        self.score+=4;
                    }
                    else{
                        otherCard.faceUp=NO;
                    }
                }
            }
        }
    }
    
    
    
    
}

@end
