//
//  BViewController.h
//  星座运程
//
//  Created by tarena on 15/10/14.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BViewController;



@protocol BViewControllerDelegate <NSObject>

-(void)bViewController:(BViewController *)bvc didFinishInput:(NSInteger)index;

@end


@interface BViewController : UIViewController
@property(nonatomic,weak) id<BViewControllerDelegate> delegate;




@end
