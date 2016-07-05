//
//  TRMainCollectionViewController.m
//  TRSearchDeals
//
//  Created by tarena on 15/11/23.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "TRMainCollectionViewController.h"
#import "UIBarButtonItem+TRBarItem.h"
#import "TRNaviLeftView.h"
#import "TRSortViewController.h"
#import "TRRegionViewController.h"
#import "TRCategory.h"
#import "TRRegion.h"
#import "TRSort.h"
#import "DPAPI.h"
#import "TRDeal.h"
#import "TRCategoryViewController.h"
#import "TRSearchViewController.h"
#import "TRNaviController.h"
#import "TRMapViewController.h"

@interface TRMainCollectionViewController ()
//分类视图
@property (nonatomic, strong) TRNaviLeftView *categoryView;
//区域视图
@property (nonatomic, strong) TRNaviLeftView *regionView;
//排序视图
@property (nonatomic, strong) TRNaviLeftView *sortView;

@property (nonatomic, strong) NSString *selectedCityName;
@property (nonatomic, strong) NSString *selectedRegion;
@property (nonatomic, strong) NSString *selectedSubRegion;
@property (nonatomic, strong) NSString *selectedCategory;
@property (nonatomic, strong) NSString *selectedSubCategory;
@property (nonatomic, assign) int selectedSort;

@end

@implementation TRMainCollectionViewController

static NSString * const reuseIdentifier = @"deal";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes(适合于直接在storyboard设置的cell)
    
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    //创建右边两个item
    [self setupRightItems];
    
    //创建左边的四个item
    [self setupLeftItems];
    
    //监听通知
    [self listenNotifications];
    
   
}

#pragma mark---监听通知以及收到通知方法
- (void)listenNotifications{
    //城市
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cityDidChange:) name:@"TRCityChange" object:nil];
    //区域
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(regionDidChange:) name:@"TRRegionChange" object:nil];
    //排序
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sortDidChange:) name:@"TRSortChange" object:nil];
    //分类
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(categoryDidChange:) name:@"TRCategoryChange" object:nil];
}

-(void)categoryDidChange:(NSNotification *)notification{
    TRCategory *category=notification.userInfo[@"TRSelectedCategory"];
    self.selectedCategory=category.name;
    self.selectedSubCategory=notification.userInfo[@"TRSelectedSubCategoriesName"];
    //设置categoryView三个控件
    self.categoryView.titleLabel.text=self.selectedCategory;
    self.categoryView.subTitleLabel.text=self.selectedSubCategory;
    [self.categoryView.imageButton setImage:[UIImage imageNamed:category.icon] forState:UIControlStateNormal];
    [self.categoryView.imageButton setImage:[UIImage imageNamed:category.highlighted_icon] forState:UIControlStateHighlighted];
    
    //发送请求（加载团购订单）
    [self loadNewDeals];
}

-(void)cityDidChange:(NSNotification *)notification{
    //获取通知的参数
     NSString *cityName=notification.userInfo[@"TRSelectedCityName"];
    self.selectedCityName=cityName;
    //发送请求（加载团购订单）
    [self loadNewDeals];
}

-(void)regionDidChange:(NSNotification *)notification{
    //获取通知的参数
    TRRegion *region=notification.userInfo[@"TRSelectedRegion"];
    self.selectedRegion=region.name;
    self.selectedSubRegion=notification.userInfo[@"TRSelectedSubRegionName"];
    //设定regionView
    self.regionView.titleLabel.text=[NSString stringWithFormat:@"%@-%@",self.selectedCityName,self.selectedRegion];
    self.regionView.subTitleLabel.text=self.selectedSubRegion;
    [self.regionView.imageButton setImage:[UIImage imageNamed:@"icon_district"] forState:UIControlStateNormal];
    [self.regionView.imageButton setImage:[UIImage imageNamed:@"icon_district_highlighted"] forState:UIControlStateHighlighted];
    
    
    //发送请求（加载团购订单）
    [self loadNewDeals];
}

-(void)sortDidChange:(NSNotification *)notification{
    //获取通知的参数
    TRSort *sort=notification.userInfo[@"TRSelectedSort"];
    self.selectedSort=[sort.value intValue];
    //设置sortView
    self.sortView.titleLabel.text=@"排序";
    self.sortView.subTitleLabel.text=sort.label;
    [self.sortView.imageButton setImage:[UIImage imageNamed:@"icon_sort"] forState:UIControlStateNormal];
    [self.sortView.imageButton setImage:[UIImage imageNamed:@"icon_sort_highlighted"] forState:UIControlStateHighlighted];
    
    //发送请求（加载团购订单）
    [self loadNewDeals];
}


#pragma mark---创建Items
- (void)setupLeftItems{
    UIBarButtonItem *logoItem=[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_meituan_logo"] style:UIBarButtonItemStyleDone target:nil action:nil];
    //设置不可点击
    logoItem.enabled=NO;
    
    //分类Item
    self.categoryView=[TRNaviLeftView naviView];
    [self.categoryView.imageButton addTarget:self action:@selector(clickCategoryView) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *categoryItem=[[UIBarButtonItem alloc] initWithCustomView:self.categoryView];
    //区域Item
    self.regionView=[TRNaviLeftView naviView];
    [self.regionView.imageButton addTarget:self action:@selector(clickRegionView) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *regionItem=[[UIBarButtonItem alloc] initWithCustomView:self.regionView];
    
    //排序Item
    self.sortView=[TRNaviLeftView naviView];
    [self.sortView.imageButton addTarget:self action:@selector(clickSortView) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *sortItem=[[UIBarButtonItem alloc] initWithCustomView:self.sortView];
    self.navigationItem.leftBarButtonItems=@[logoItem,categoryItem,regionItem,sortItem];
}

- (void)setupRightItems{
   UIBarButtonItem *mapItem =[UIBarButtonItem itemWithImageName:@"icon_map" withHighlightedImageName:@"icon_map_highlighted" withTarget:self withAction:@selector(clickMapItem)];
    UIBarButtonItem *searchItem =[UIBarButtonItem itemWithImageName:@"icon_search" withHighlightedImageName:@"icon_search_highlighted" withTarget:self withAction:@selector(clickSearchItem)];
    
    self.navigationItem.rightBarButtonItems=@[mapItem, searchItem];
}

#pragma mark---navigationBarItem触发方法

- (void)clickCategoryView{
    TRCategoryViewController *categoryViewController=[TRCategoryViewController new];
    categoryViewController.modalPresentationStyle=UIModalPresentationPopover;
    categoryViewController.popoverPresentationController.sourceView=self.categoryView;
    categoryViewController.popoverPresentationController.sourceRect=self.categoryView.bounds;//(0,0,130,40)
    [self presentViewController:categoryViewController animated:YES completion:nil];
}

- (void)clickRegionView{
    TRRegionViewController *regionViewController=[TRRegionViewController new];
    regionViewController.modalPresentationStyle=UIModalPresentationPopover;
    regionViewController.popoverPresentationController.sourceView=self.regionView;
    regionViewController.popoverPresentationController.sourceRect=self.regionView.bounds;//(0,0,130,40)
    [self presentViewController:regionViewController animated:YES completion:nil];
}

- (void)clickSortView{
//创建排序视图控制器
    TRSortViewController *sortViewController=[TRSortViewController new];
    //设置modal显示的一些属性
    sortViewController.modalPresentationStyle=UIModalPresentationPopover;
    //设置从哪弹出（箭头指向何方）
    sortViewController.popoverPresentationController.sourceView=self.sortView;
    //设置箭头准确位置
    sortViewController.popoverPresentationController.sourceRect=self.sortView.bounds;
   //显示控制器
    [self presentViewController:sortViewController animated:YES completion:nil];
    
}

- (void)clickMapItem{
    //创建地图控制器对象
    TRMapViewController *mapViewController=[TRMapViewController new];
    TRNaviController *navi=[[TRNaviController alloc] initWithRootViewController:mapViewController];
    //显示
    [self presentViewController:navi animated:YES completion:nil];

}

- (void)clickSearchItem{
    //创建搜索控制器对象
    TRSearchViewController *searchViewController=[TRSearchViewController new];
    //将城市名字传过去
    if (self.selectedCityName) {
        searchViewController.cityName=self.selectedCityName;
    }else{
    searchViewController.cityName=@"北京";
    }
    //显示搜索控制器（TRNaviController）
    TRNaviController *navi=[[TRNaviController alloc] initWithRootViewController:searchViewController];
    [self presentViewController:navi animated:YES completion:nil];
}

#pragma mark---实现父类提供的设置参数的方法
-(void)settingParams:(NSMutableDictionary *)params
{
    //城市（必须发送参数）
    if (self.selectedCityName) {
        params[@"city"]=self.selectedCityName;
    }else{
        //用户没有选择城市（给定默认的城市）
        params[@"city"]=@"北京";
    }
    //排序
    if (self.selectedSort) {
        params[@"sort"]=@(self.selectedSort);
    }
    
    //区域
    if (self.selectedRegion) {
        //有子区域
        if (self.selectedSubRegion) {
            params[@"region"]=self.selectedSubRegion;
        }else{
            //没有子区域
            params[@"region"]=self.selectedRegion;
        }
    }
    //分类
    if (self.selectedCategory) {
        if (self.selectedSubCategory) {
            params[@"category"]=self.selectedSubCategory;
        }else{
            //没有子区域
            params[@"category"]=self.selectedCategory;
        }
    }

}


@end
