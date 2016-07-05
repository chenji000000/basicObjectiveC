//
//  MyTableViewController.m
//  Demo6_自定义版的内容视图
//
//  Created by tarena on 15/10/17.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MyTableViewController.h"

@interface MyTableViewController ()

@end

@implementation MyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //注册
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"MyCell"];
    
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 50;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell" forIndexPath:indexPath];
    
    
    //1.尝试着去Cell按照tag值取标签
    UILabel *label=(UILabel *)[cell viewWithTag:1];
                    
    //2.判断是否取到了label，如果没取到，新建
                    
    //设置label显示文字的样式为红色，大字号，斜体，居中，带阴影
    if(label==nil){
        label=[[UILabel alloc] init];
        //右缩进的快捷键：command+]
        label.textColor=[UIColor redColor];
        label.font=[UIFont italicSystemFontOfSize:20];
        label.textAlignment=NSTextAlignmentCenter;
        label.shadowOffset=CGSizeMake(1, 1);
        label.shadowColor=[UIColor blackColor];
        label.frame=CGRectMake(0, 0, cell.bounds.size.width, 40);
        //为新建的label添加tag值
        label.tag=1;
        
        //3.将label添加到内容视图中
        //因为Cell一定得显示内容，所以contentView
        //很重要。于是，系统就自动将contentView
        //创建出实例了，所以，可以直接向contentView
        //中添加子视图
        [cell.contentView addSubview:label];
    }
    label.text=[NSString stringWithFormat:@"%ld",indexPath.row];
    
    
    
    
    
    
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
