//
//  InputViewController.h
//  Demo7_反向传值
//
//  Created by tarena on 15/10/23.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@class InputViewController;

@protocol InputViewControllerDelegate <NSObject>

-(void)InputViewController:(InputViewController *)vc didInputString:(NSString *)nsg;

@end

@interface InputViewController : UIViewController
@property(nonatomic,weak) id<InputViewControllerDelegate> delegate;

@end
