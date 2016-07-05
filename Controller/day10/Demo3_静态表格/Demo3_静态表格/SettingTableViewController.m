//
//  SettingTableViewController.m
//  Demo3_静态表格
//
//  Created by tarena on 15/10/20.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "SettingTableViewController.h"
#import "User.h"

@interface SettingTableViewController ()
@property(nonatomic,strong)User *currentUser;
@end

@implementation SettingTableViewController


-(User *)currentUser
{

    if (!_currentUser) {
        _currentUser=[[User alloc]init];
        _currentUser.wechatNum=@"123";
        _currentUser.qqNum=@"98765";
        _currentUser.telNum=@"123344";
        _currentUser.email=@"dijd123@163.com";
        _currentUser.protect=NO;
    }
    return _currentUser;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航栏背景色
    self.navigationController.navigationBar.barTintColor=[UIColor blackColor];
    
    //通过设置导航栏的样式为深色系，系统检测到以后，就会自动把状态栏的颜色变为白色
    self.navigationController.navigationBar.barStyle=UIBarStyleBlack;
    
    self.navigationItem.title=@"账号与安全";
    
    //表尾视图
    UILabel *label=[[UILabel alloc] init];
    //label能换行
    label.numberOfLines=2;
    
    //label的大小
    label.frame=CGRectMake(0, 0, 0, 50);
    
    //label上面的文字
    label.text=@"如果遇到账号信息泄露，忘记密码，诈骗等账号安全问题，可以前往微信安全中心.";
    label.font=[UIFont systemFontOfSize:14];
    
    label.textAlignment=NSTextAlignmentCenter;
    
    
    self.tableView.tableFooterView=label;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if(section==0)
    {
        return 1;
    }else if (section==1)
    {
        return 3;
    }else
        return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
 
 cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    
    switch (indexPath.section) {
        case 0://第一个分区
         cell.accessoryType=UITableViewCellAccessoryNone;
            cell.textLabel.text=@"微信号";
            cell.detailTextLabel.text=self.currentUser.wechatNum;
            break;
        case 1://第二个分区
            
            if (indexPath.row==0) {//第一行
            cell.textLabel.text=@"QQ号";
                cell.detailTextLabel.text=self.currentUser.qqNum;
            }else if (indexPath.row==1)
            {//第二行
            cell.textLabel.text=@"手机号";
                cell.detailTextLabel.text=self.currentUser.telNum;
            }else
            {//第三行
            cell.textLabel.text=@"邮箱地址";
                cell.detailTextLabel.text=self.currentUser.email;
            }
            break;
        case 2://第三个分区
            if(indexPath.row==0){
            cell.textLabel.text=@"微信密码";
            
            }else if (indexPath.row==1){
            cell.textLabel.text=@"账号保护";
                UIImageView *iv=[[UIImageView alloc] initWithImage:[UIImage imageNamed:self.currentUser.isProtect?@"array.png":@"array 2.png"]];
                
                iv.frame=CGRectMake(270, 12, 20, 20);
                [cell.contentView addSubview:iv];
                
                cell.detailTextLabel.text=self.currentUser.isProtect?@"已保护":@"未保护";
            }else
            {
            cell.textLabel.text=@"微信安全中心";
                cell.accessoryType=UITableViewCellAccessoryDetailButton;
            }
            break;
        
    }
    
    return cell;
}

//分区头的高
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{

    return 20;
}
//分区尾的高
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //点击单元格里面不是圆圈i的部分时，响应
    NSLog(@"didSelectRowAtIndexPath");
}
-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    //点击单元格中圆圈i时才响应
    NSLog(@"accessoryButton");
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
