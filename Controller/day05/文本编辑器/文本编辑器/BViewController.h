//
//  BViewController.h
//  文本编辑器
//
//  Created by tarena on 15/10/14.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BViewController;

@protocol BViewControllerDelegate <NSObject>
-(void)BViewController:(BViewController *)bViewController andFrame:(CGRect)frame andText:(NSString *)text;
@end

@interface BViewController : UIViewController
@property(nonatomic,assign) id<BViewControllerDelegate> delegate;

@end
