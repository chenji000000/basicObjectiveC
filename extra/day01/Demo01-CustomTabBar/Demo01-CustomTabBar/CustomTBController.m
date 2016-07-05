//
//  CustomTBController.m
//  Demo01-CustomTabBar
//
//  Created by tarena on 15/12/14.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "CustomTBController.h"
#import "Masonry.h"
/**
 *  自定义TabBar的原理：
 1.隐藏掉系统自带的tabBar
 2.使用自定义的视图，代替tabBar
 3.当选中按钮时，执行selectIndex的切换操作
 */


@interface CustomTBController ()
/**
 *  自定义TabBar所在视图，全屏宽，距离上方20（让出电池条），高度与原生TabBar高度一样
 */
@property (nonatomic, strong) UIView *customTBView;
@end

@implementation CustomTBController

- (UIView *)customTBView {
    if(_customTBView == nil) {
        _customTBView = [[UIView alloc] init];
        _customTBView.backgroundColor = [UIColor lightGrayColor];
        [self.view addSubview:_customTBView];
        [_customTBView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.mas_equalTo(20);
            make.height.mas_equalTo(self.tabBar.mas_height);
        }];
        
        /**
         *  4个按钮，上下边缘都距离父视图0
            4个按钮宽高相等
            第一个按钮，左侧距离父视图左侧0
            剩余按钮左侧距离上一个按钮右侧0
            最后一个按钮，右侧距离父视图右侧0
         */
        NSArray *btnColors = @[[UIColor yellowColor], [UIColor brownColor], [UIColor cyanColor], [UIColor blueColor]];
        /**
         *  指针-->指向上一个按钮
         */
        UIButton *lastBtn = nil;
        for (int i = 0; i < btnColors.count; i++) {
            UIButton *btn = [UIButton buttonWithType:0];
            [_customTBView addSubview:btn];
            btn.backgroundColor = btnColors[i];
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.bottom.mas_equalTo(0);
                if (i == 0) {
                    make.left.mas_equalTo(0);
                } else {
                    make.left.mas_equalTo(lastBtn.mas_right);
                    make.width.mas_equalTo(lastBtn.mas_width);
                    if (i == btnColors.count - 1) {
                        make.right.mas_equalTo(0);
                    }
                }
            }];
            lastBtn = btn;
            [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
            /**
             *  通过按钮的tag值来区分当前是哪个按钮触发的点击事件
             */
            btn.tag = 100 + i;
 }
             }
    return _customTBView;

}

- (void)clickBtn:(UIButton *)sender{
    /**
     *  100,101,102,103
     */
    NSInteger tag = sender.tag;
    /**
     * 控制器的索引值是0~3
     
     */
    self.selectedIndex = tag - 100;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tabBar.hidden = YES;
    self.customTBView.hidden = NO;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
