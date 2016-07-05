//
//  MainTableViewController.m
//  Demo04_搜索框
//
//  Created by xiaoz on 15/9/30.
//  Copyright (c) 2015年 xiaoz. All rights reserved.
//

#import "MainTableViewController.h"
#import "ShowResultTableViewController.h"
#import "Product.h"

@interface MainTableViewController ()<UISearchResultsUpdating,UISearchBarDelegate>

//存储所有商品信息
@property(nonatomic,strong)NSArray *allProducts;

//增加属性：用于记录搜索控制器
@property(nonatomic,strong)UISearchController *searchController;
//增加属性：用于展示搜索结果的表视图控制器
@property(nonatomic,strong)ShowResultTableViewController *showResultVC;

@end

@implementation MainTableViewController

- (NSArray *)allProducts
{
    if (!_allProducts) {
        _allProducts = [Product demoData];
    }
    return _allProducts;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建用于展示搜索结果的表vc实例
    self.showResultVC = [[ShowResultTableViewController alloc]init];
    
    // 创建搜索控制器的实例
    self.searchController = [[UISearchController alloc]initWithSearchResultsController:self.showResultVC];
    
    // 设置搜索条的尺寸为自适应
    [self.searchController.searchBar sizeToFit];
    
    // 设置搜索条中的分段类别
    self.searchController.searchBar.scopeButtonTitles = @[@"设备",@"软件",@"其他"];
    
    // 当前主控制器的视图的表头添加searchBar
    self.tableView.tableHeaderView = self.searchController.searchBar;
    
    // 设置搜索控制器的结果更新代理对象
    self.searchController.searchResultsUpdater = self;
    
    // 允许在当前界面上切换展示数据的上下文对象
    // 允许从主table切换为展示结果的table
    self.definesPresentationContext = YES;
    
    // 为了点击searchBar上的类别按钮时，也能有响应
    // 所以设置searchBar的代理
    self.searchController.searchBar.delegate = self;
    
}

#pragma mark - UISearchBarDelegate协议
// 只要选择了新的类别,重新调用下面的搜索方法再次比对
- (void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope
{
    [self updateSearchResultsForSearchController:self.searchController];
}

#pragma mark - UISearchResultUpdating协议
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    // 从委托方中获取用户在文本框中输入的文字内容
    NSString *searchText = searchController.searchBar.text;
    
    // 从委托方中获取用户选择的类别按钮
    NSInteger selectedButtonIndex = searchController.searchBar.selectedScopeButtonIndex;
    
    //到self.allProducts中逐一比对数据
    NSMutableArray *resultArray = [NSMutableArray array];
    
    for (Product *p in self.allProducts) {
        NSRange range = [p.name rangeOfString:searchText];
        // 如果名称匹配 且类别相同
        // 则将此产品记录到结果数组中
        if (range.length>0 && p.type==selectedButtonIndex) {
            [resultArray addObject:p];
        }
        
    }
    
    // 将要展示的数据结果给 负责显示的vc传过去
    self.showResultVC.resultArray = resultArray;
    
    // 更新视图显示数据
    [self.showResultVC.tableView reloadData];
    
}








#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.allProducts.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    Product *p = self.allProducts[indexPath.row];
    cell.textLabel.text = p.name;
    
    return cell;
}


@end
