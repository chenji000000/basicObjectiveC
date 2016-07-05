//
//  MyCollectionViewController.m
//  Demo1_集合视图控制器
//
//  Created by tarena on 15/10/21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MyCollectionViewController.h"

@interface MyCollectionViewController ()


@end

@implementation MyCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
  
}




#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 3;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 9;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.backgroundColor=[UIColor redColor];
   
    //创建标签
    
    
    UILabel *label=(UILabel *)[cell.contentView viewWithTag:1];
    
    if (label==nil) {
        
        label=[[UILabel alloc] init];
       label.tag=1;
        label.frame=CGRectMake(0, 0, cell.bounds.size.width, cell.bounds.size.height);
        label.font=[UIFont systemFontOfSize:34];
        label.textColor=[UIColor whiteColor];
        label.textAlignment=NSTextAlignmentCenter;
        
        
      //将标签添加到Cell的contentView中
        [cell.contentView addSubview:label];
    }
    label.text=[NSString stringWithFormat:@"%ld", indexPath.item];
    
    
    
    
    
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
