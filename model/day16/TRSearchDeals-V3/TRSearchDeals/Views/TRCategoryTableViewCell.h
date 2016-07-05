//
//  TRCategoryTableViewCell.h
//  TRSearchDeals
//
//  Created by tarena on 15/11/24.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRCategory.h"

@interface TRCategoryTableViewCell : UITableViewCell
@property(nonatomic, strong) TRCategory *category;
+ (id)cellWithTableView:(UITableView *)tableView withImageName:(NSString *)imageName withSelectedImageName:(NSString *)selectedName;

@end
