//
//  ViewController.h
//  Day02_PlugIns
//
//  Created by tarena on 15/12/15.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

//VVDocumenter的用法, 在需要注释的方法上,输入3个/
/**
 *  初始化***** 方法描述
 *
 *  @param userName 用户名
 *  @param age      用户年龄
 *  @param sex      用户性别
 *
 *  @return 返回***类型....
 */
- (id)initWithName:(NSString *)userName age:(NSUInteger)age sex:(NSString *)sex;
@end















