//
//  SettingTableViewController.m
//  Demo4_静态表格_xib
//
//  Created by tarena on 15/10/20.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "SettingTableViewController.h"

@interface SettingTableViewController ()

@property (strong, nonatomic) IBOutlet UITableViewCell *greenDiaCell;
@property (strong, nonatomic) IBOutlet UITableViewCell *freeCell;
@property (strong, nonatomic) IBOutlet UITableViewCell *ontimeCloseCell;
@property (strong, nonatomic) IBOutlet UITableViewCell *exitCell;

@property (strong, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UILabel *screenNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;


@end

@implementation SettingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //显示信息到视图中
    self.screenNameLabel.text=@"xiaoz";
    //显示圆形的图片
    self.headerImageView.layer.cornerRadius=25;
    self.headerImageView.layer.masksToBounds=YES;
    
    //设置视图的红边框
    self.headerImageView.layer.borderColor=[UIColor redColor].CGColor;
    self.headerImageView.layer.borderWidth=2;
    
    self.navigationItem.title=@"更多 ";
    //设置表格头
    self.tableView.tableHeaderView=self.headerView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 2;
        case 1:
            return 1;
        default:
            return 1;
    }
   
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
            if (indexPath.row==0) {
                return self.greenDiaCell;
            }else{
                return self.freeCell;
            }
            
        case 1:
            return self.ontimeCloseCell;
        default:
            return self.exitCell;
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
