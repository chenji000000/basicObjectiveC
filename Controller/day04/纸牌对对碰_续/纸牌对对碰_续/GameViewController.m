//
//  GameViewController.m
//  纸牌对对碰_续
//
//  Created by tarena on 15/10/13.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *allButtons;

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)clickButton:(UIButton *)sender {
    NSInteger index=[self.allButtons indexOfObject:sender];
    NSLog(@"%ld",index);
}


@end
