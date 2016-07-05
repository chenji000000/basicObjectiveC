//
//  TRCategoryTableViewCell.m
//  TRSearchDeals
//
//  Created by tarena on 15/11/24.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "TRCategoryTableViewCell.h"

@implementation TRCategoryTableViewCell

+(id)cellWithTableView:(UITableView *)tableView withImageName:(NSString *)imageName withSelectedImageName:(NSString *)selectedName
{
    //重用机制
    static NSString *identifier=@"cell";
    TRCategoryTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell=[[TRCategoryTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    //设置cell两个背景图片
    cell.backgroundView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    cell.selectedBackgroundView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:selectedName]];
    return cell;
}

-(void)setCategory:(TRCategory *)category
{
    //文本
    self.textLabel.text=category.name;
    self.imageView.image=[UIImage imageNamed:category.icon];
    self.imageView.highlightedImage=[UIImage imageNamed:category.highlighted_icon];
    //右箭头
    if (category.subcategories.count>0) {
        self.accessoryView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_cell_rightArrow"]];
    }else{
        self.accessoryView=nil;
    }
}
@end
