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

@interface TRMainCollectionViewController ()
//分类视图
@property (nonatomic, strong) TRNaviLeftView *categoryView;
//区域视图
@property (nonatomic, strong) TRNaviLeftView *regionView;
//排序视图
@property (nonatomic, strong) TRNaviLeftView *sortView;

@end

@implementation TRMainCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    //创建右边两个item
    [self setupRightItems];
    
    //创建左边的四个item
    [self setupLeftItems];
}

#pragma mark---创建Items
- (void)setupLeftItems{
    UIBarButtonItem *logoItem=[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_meituan_logo"] style:UIBarButtonItemStyleDone target:nil action:nil];
    //设置不可点击
    logoItem.enabled=NO;
    
    //分类Item
    self.categoryView=[TRNaviLeftView naviView];
    UIBarButtonItem *categoryItem=[[UIBarButtonItem alloc] initWithCustomView:self.categoryView];
    //区域Item
    self.regionView=[TRNaviLeftView naviView];
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

}

- (void)clickSearchItem{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete implementation, return the number of sections
    return 0;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of items
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
