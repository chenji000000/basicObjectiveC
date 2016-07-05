//
//  NewsTableViewController.m
//  Demo5_新闻客户端
//
//  Created by tarena on 15/10/19.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "NewsTableViewController.h"
#import "News.h"
#import "NewsCell.h"

@interface NewsTableViewController ()
@property(nonatomic,strong) NSArray *allNews;
@end

@implementation NewsTableViewController

-(NSArray *)allNews
{
    if (!_allNews) {
        _allNews=[News demoData];
    }
    return _allNews;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"新闻";
    //设置表头视图
    UIImageView *imageView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"header.png"]];
    imageView.frame=CGRectMake(0, 0, 122222, 211);
    self.tableView.tableHeaderView=imageView;
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.allNews.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell"];
    
    if(cell==nil){
    //明确说明通过加载那个xib文件来创建
        //视图的实例
        //NSBundle mainBundle代表的是程序xxx.app
        //的那个包，通过这个包，就可以加载包内的一切资源
        //包括，xib文件都可以加载，并依据xib中设计样式创建xib中拖拽的所有对象，所以该方法返回的
        //是数组类型，又因为当前NewsCell.xib文件中只有一个视图，所以，从数组中通过lastObject方法
        //访问这个返回数组中的唯一一个对象
        cell=[[[NSBundle mainBundle] loadNibNamed:@"NewsCell" owner:nil options:nil] lastObject];
    }
    
    //先根据行号找到对应的新闻对象
    News *news=self.allNews[indexPath.row];
    //再显示新闻的各个属性到Cell的指定视图中
    cell.NewsImageView.image=[UIImage imageNamed:news.imageName];
    cell.TitleLabel.text=news.title;
    cell.CommentNumberLabel.text=[NSString stringWithFormat:@"%ld",news.commentNumber];
    
    return cell;
}
//设置行高为70
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 70;
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
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
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
