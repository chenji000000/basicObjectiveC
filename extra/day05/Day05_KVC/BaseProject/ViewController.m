//
//  ViewController.m
//  BaseProject
//
//  Created by tarena on 15/12/15.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import "NewsNetManager.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController
- (IBAction)slider:(UISlider *)sender {
    //在这里判断sender的value，根据value来修改颜色，一旦有20个滑动条可以改变Label的值，那么需要在20个位置来判断
    self.label.text = @(sender.value).stringValue;
    
}

/**
 *  值：0~20 红色
 20~40 紫色
 40~60 绿色
 60~80 棕色
 80~100 蓝色
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    [NewsNetManager getNewsListWithStartIndex:1 completionHandle:^(id model, NSError *error) {
        if (!error) {
            NSLog(@"model %@",model);
        }
    }];
    
    //可以使用blocksKit 简写KVO
    [_label bk_addObserverForKeyPath:@"text" options:NSKeyValueObservingOptionNew task:^(id obj, NSDictionary *change) {
        NSLog(@"bk change %@", change);
    }];
    return;
    
    //对Label的text值添加KVO操作，键值观察操作
    /*
     参数1：那个对象观察
     参数2：观察的是Label的那个属性
     参数3：要观察属性的那种变化
     */
    [_label addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:nil];
   

}
/* 一旦KVO操作被触发，则进入下方方法 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (object == _label) {
        NSString *value = change[@"new"];
        NSLog(@"标签内容被修改 %@", value);
        if (value.floatValue >= 0 && value.floatValue < 20) {
            _label.textColor = [UIColor redColor];
        }
        if (value.floatValue >= 20&& value.floatValue < 40) {
            _label.textColor = [UIColor purpleColor];
        }
        if (value.floatValue >= 40 && value.floatValue < 60) {
            _label.textColor = [UIColor greenColor];
        }
        if (value.floatValue >= 60 && value.floatValue < 80) {
            _label.textColor = [UIColor brownColor];
        }
        if (value.floatValue >= 80 && value.floatValue <= 100) {
            _label.textColor = [UIColor blueColor];
        }
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
