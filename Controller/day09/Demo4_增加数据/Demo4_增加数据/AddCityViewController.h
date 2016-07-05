//
//  AddCityViewController.h
//  Demo4_增加数据
//
//  Created by tarena on 15/10/19.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "City.h"
@class AddCityViewController;

@protocol AddCityViewControllerDelegate <NSObject>

-(void)addcityViewController:(AddCityViewController *)aVC didFinishInput:(City *) city;

@end

@interface AddCityViewController : UIViewController
@property(nonatomic,weak) id<AddCityViewControllerDelegate> delegate;
@end
