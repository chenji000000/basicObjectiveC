//
//  NewsTableViewController.m
//  Demo1_新闻客户端
//
//  Created by tarena on 15/10/23.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "NewsTableViewController.h"
#import "News.h"
#import "NewsCell.h"
#import "DetailViewController.h"

@interface NewsTableViewController ()
@property(nonatomic,strong)NSArray *allNews;
@end

@implementation NewsTableViewController

-(NSArray *)allNews
{
    if(!_allNews){
    
        _allNews=[News demoData];
    }
    return _allNews;


}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}
//截获手动触发的跳转动作，sender参数就是perform方法中的传入的第二个参数indexPath
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath=sender;
    //获取点击的那行对应的数据
    //row:0  2  4  6  8
    //下标:0  1  2  3  4
    
    News *news=self.allNews[indexPath.row/2];
    //从Segue中获取目标VC，给其赋值
    DetailViewController *detailVC=segue.destinationViewController;
    detailVC.news=news;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.row%2==0) {
        //点击的是详情行，手动触发跳转，并且将当前点击的行所在的位置信息作为sender传给prepareForSegue方法
        [self performSegueWithIdentifier:@"DetailSegue" sender:indexPath];
    }

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.allNews.count*2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row%2==0) {
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"DetailCell" forIndexPath:indexPath];
        return cell;
    }
    NewsCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    //row:1  3  5  7  9
    //下标:0  1  2  3  4
    News *news=self.allNews[indexPath.row/2];
    cell.news=news;
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.row%2==0) {
        return 44;
    }else{
    
        return 70;
    }


}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
