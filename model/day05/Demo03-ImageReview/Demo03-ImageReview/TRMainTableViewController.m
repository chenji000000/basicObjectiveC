//
//  TRMainTableViewController.m
//  Demo03-ImageReview
//
//  Created by tarena on 15/11/10.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRMainTableViewController.h"
#import "TRImageViewController.h"

@interface TRMainTableViewController ()
@property(nonatomic,strong)NSArray *imageArray;
@end

@implementation TRMainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化数组
    self.imageArray=@[@"鲜花Flower",@"彩椒Peppers",@"水母Jellyfish",@"日落Sunset",@"孩子Children",@"滑板少年Skateboard Boy"];
    //设置navigationBar的title
    self.navigationItem.title=@"图片列表";
    
}



#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.imageArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    //设置文本（图片名字）
    cell.textLabel.text=self.imageArray[indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //拼接图片的URL
    NSString *imageStr=[NSString stringWithFormat:@"http://images.apple.com/v/iphone-5s/gallery/a/images/download/photo_%ld.jpg",indexPath.row+1];
    //创建TRImageViewController对象
    TRImageViewController *imageViewController=[[TRImageViewController alloc] initWithImageStr:imageStr];
    //present显示图片视图控制器
    [self presentViewController:imageViewController animated:YES completion:nil];
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
