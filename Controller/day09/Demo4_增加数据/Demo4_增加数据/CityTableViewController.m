//
//  CityTableViewController.m
//  Demo4_增加数据
//
//  Created by tarena on 15/10/19.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "CityTableViewController.h"
#import "City.h"
#import "AddCityViewController.h"
@interface CityTableViewController ()<AddCityViewControllerDelegate>

//属性存储一组用于显示到表格的数据
@property(nonatomic,strong) NSMutableArray *allCities;
@end

@implementation CityTableViewController
-(NSMutableArray *)allCities
{

    if(!_allCities){
        //将数组执行mutableCopy操作的话，则返回的是NSMutableArray
        //将数组执行copy操作的话，则返回的是NSArray
        _allCities=[[City demoData] mutableCopy];
    }
    return _allCities;
}
-(void)addcityViewController:(AddCityViewController *)aVC didFinishInput:(City *)city 
{
    //把新发回来的数据先存到数组中
    [self.allCities addObject:city];
    //刷新表格
//    [self.tableView reloadData];
    NSIndexPath *newIndexPath=[NSIndexPath indexPathForRow:self.allCities.count-1 inSection:0];
    
    [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationTop];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"城市信息";
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(clickAddButton:)];
}

//点击加号按钮，推出新的界面
-(void)clickAddButton:(UIBarButtonItem *)button
{
    AddCityViewController *aCV=[[AddCityViewController alloc] init];
    //将当前控制器设置成为aCV的代理
    //aCV才能给当前控制器发消息
    aCV.delegate=self;
    
    [self.navigationController pushViewController:aCV animated:YES];


}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.allCities.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" ];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1  reuseIdentifier:@"Cell"];
    }
    //按照行号找到City
    City *city=self.allCities[indexPath.row];
    cell.textLabel.text=city.name;
    cell.detailTextLabel.text=[NSString stringWithFormat:@"%ld万",city.population];
    
    
    return cell;
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
