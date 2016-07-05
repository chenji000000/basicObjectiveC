//
//  TRCategoryViewController.m
//  TRSearchDeals
//
//  Created by tarena on 15/11/24.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "TRCategoryViewController.h"
#import "TRCategory.h"
#import "TRMetaDataTool.h"
#import "TRTableViewCell.h"

@interface TRCategoryViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (weak, nonatomic) IBOutlet UITableView *subTableView;
@property (nonatomic, strong) NSArray *categoriesArray;

@end

@implementation TRCategoryViewController

-(NSArray *)categoriesArray
{
    if (!_categoriesArray) {
        //数据来源[TRMetaDataTool categories];
        _categoriesArray=[TRMetaDataTool categories];
    }
    return _categoriesArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
#pragma mark---UITableViewDataSourceDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView==self.mainTableView) {
        //左边
        return self.categoriesArray.count;
    }else{
        //右边
        //获取用户选择左边的那行的行号
        NSInteger selectedRow=[self.mainTableView indexPathForSelectedRow].row;
        TRCategory *category=self.categoriesArray[selectedRow];
        return category.subcategories.count;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //重用机制
    if (tableView==self.mainTableView) {
        TRTableViewCell *cell=[TRTableViewCell cellWithTableView:tableView withImageName:@"bg_dropdown_leftpart" withSelectedImageName:@"bg_dropdown_left_selected"];
        //设置cell属性(重写setCategory方法)
        cell.category=self.categoriesArray[indexPath.row];
        return cell;
    }else{
        TRTableViewCell *cell=[TRTableViewCell cellWithTableView:tableView withImageName:@"bg_dropdown_rightpart" withSelectedImageName:@"bg_dropdown_right_selected"];
        //设置右边cell的文本（子区域）
        NSInteger selectedRow=[self.mainTableView indexPathForSelectedRow].row;
        TRCategory *category=self.categoriesArray[selectedRow];
        cell.textLabel.text=category.subcategories[indexPath.row];
        return cell;
    }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView==self.mainTableView) {
         //加载右边tableView
        [self.subTableView reloadData];
        //情况一: 没有子分类;发送通知(TRCategory)
        TRCategory *category=self.categoriesArray[indexPath.row];
        if (category.subcategories.count==0) {
            //发送通知（带参数：TRCategory）
            [[NSNotificationCenter defaultCenter] postNotificationName:@"TRCategoryChange" object:self userInfo:@{@"TRSelectedCategory":category}];
            //收回弹出控制器
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }else{
        //情况二：有子区域；发送通知（带参数：TRCategory;SubCategoryName）
        //获取左边和右边选中行号
        NSInteger leftSelectedRow=[self.mainTableView indexPathForSelectedRow].row;
        NSInteger rightSelectedRow=[self.subTableView indexPathForSelectedRow].row;
        //左边区域模型对象
        TRCategory *category=self.categoriesArray[leftSelectedRow];
        //右边子区域的名字
        NSString *subCategoriesName=category.subcategories[rightSelectedRow];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"TRCategoryChange" object:self userInfo:@{@"TRSelectedCategory":category,@"TRSelectedSubCategoriesName":subCategoriesName}];
        //收回弹出控制器
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
}
@end
