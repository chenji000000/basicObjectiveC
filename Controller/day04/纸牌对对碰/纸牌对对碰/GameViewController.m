//
//  GameViewController.m
//  纸牌对对碰
//
//  Created by tarena on 15/10/13.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "GameViewController.h"
#import "Game.h"
#import "Poker.h"
#import "Card.h"

@interface GameViewController ()
//系统为我们自动创建了一个名字叫做allButton的数组，这个数组存储中所有的对象引用都是UIButton类型的，且，每一个button都是来自界面上拖拽的有系统创建的按钮对象
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *allButtons;

//增加两个属性，用于模拟游戏，和使用到扑克
@property(nonatomic,strong) Poker *poker;
@property(nonatomic,strong) Game *game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;


@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.初始化一套全新的扑克牌
    self.poker=[[Poker alloc] init];
    //2. 创建游戏
    self.game=[[Game alloc] initWithPoker:self.poker forCardCount:self.allButtons.count];
    //3.更新界面
    [self updateView];
    
}


//更新界面
-(void)updateView
{
  //更新分数的显示
    self.scoreLabel.text=[NSString stringWithFormat:@"分数：%ld",self.game.score];
//遍历每一个按钮，按照按钮的下标，去游戏中
//找到该下标对应的纸牌，然后将纸牌信息显示在按钮上
    for(int i=0;i<self.allButtons.count;i++)
    {
    //根据下标找到该位置的纸牌
        Card *card=self.game.allRandomCards[i];
    //根据下标找到该位置的按钮
        UIButton *button=self.allButtons[i];
        
    // 根据纸牌状态,决定按钮上显示的背景图
        [button setBackgroundImage:[UIImage imageNamed:[self imageNameForCard:card]] forState:UIControlStateNormal];
        
        
        
    //根据纸牌状态,决定按钮上显示的文字
        [button setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        
        //根据纸牌的是否匹配，决定按钮是否可用
        //card matched YES NO
        //button enabled NO YES
        button.enabled=!card.isMatched;
        
    }
}
// 依据传入的纸牌对象,返回要加载的图片名称
-(NSString *)imageNameForCard:(Card *)card
{
    return card.isFaceUp?@"cardfront.png":@"cardback.png";
}



//依据传入的纸牌对象，返回要显示的按钮文字信息
-(NSString *)titleForCard:(Card *)card
{
    return card.isFaceUp?card.cardInfo:@"";
}




//点击按钮后响应
- (IBAction)clickButton:(UIButton *)sender {
    //根据本次点击的按钮sender，到数组中
    //1.查找该按钮对应的下标
    NSInteger index=[self.allButtons indexOfObject:sender];
    NSLog(@"%ld",index);
    
    
    //2.通知游戏类，本次点击的纸牌的位置
    [self.game tapCardAtIndex:index];
    
    //3.根据game该玩的数据，刷新界面
    [self updateView];
}






@end
