//
//  CityTableViewController.m
//  Demo2_表格的编辑模式
//
//  Created by tarena on 15/10/20.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "CityTableViewController.h"
#import "City.h"

@interface CityTableViewController ()
@property(nonatomic,strong) NSMutableArray *allCities;
@end

@implementation CityTableViewController

-(NSMutableArray *)allCities
{

    if (!_allCities) {
        _allCities=[[City demoData] mutableCopy];
    }
    return _allCities;
}

//申明一个独立的变量
static NSString *reuseIdentifier=@"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title=@"城市列表";
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:reuseIdentifier];
    
    
    
    //配置导航栏的右侧编辑键钮
    
    //只有前面是表视图控制器才能使用
//    self.navigationItem.rightBarButtonItem=self.editButtonItem;
    
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(clickEditButton:)];
}
//点击右上角的编辑按钮后，进入到编辑模式
-(void)clickEditButton:(UIBarButtonItem *)item
{
    //先修改表视图的状态
    [self.tableView setEditing:!self.tableView.isEditing animated:YES];
    //判断表视图的状态，决定导航按钮上显示的文字
    if (self.tableView.isEditing) {
        [item setTitle:@"完成"];
    }else{
        [item setTitle:@"编辑"];
    }
    
}

#pragma mark - 表格的移动：一问一答
//问1：是否可以移动
-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;

}

//答1：移动后做什么
-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
//只需完成数组中数据的顺序的调整，界面无需做操作，系统完成
    //1.先将原位置的数据取出
    City *moveCity=self.allCities[sourceIndexPath.row];
    //2.将该位置的数据从数组中remove
    [self.allCities removeObjectAtIndex:sourceIndexPath.row];
    //3.将第1步记录的那个数据，按照新的位置再添加回数组
    [self.allCities insertObject:moveCity atIndex:destinationIndexPath.row];
}



#pragma mark - 表格的编辑模式


//问1：该行是否可以编辑
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if (indexPath.row==0) {
//        return NO;
//    }else{
        return YES;
//    }
}

//问2：该行的编辑样式
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==self.allCities.count-1) {
        return UITableViewCellEditingStyleInsert;
    }else{
        return UITableViewCellEditingStyleDelete;
    }

}

//答1：点击了按钮后如何响应
//不管点击的是绿色加，还是点两下后的红色delegate，都会执行该方法，参数：editingStyle就是点击的那个按钮的样式
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        //删除功能
        //1.删除数组中的数据
        [self.allCities removeObjectAtIndex:indexPath.row];
        //2.刷新界面
        //不用使用reloadData来刷新整个界面，只需要将删除的数据对应的行，从表视图中删除即可
//        [tableView reloadData];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    }else{
    //增加功能
        //1.向数组中添加数据
        City *newCity=[[City alloc] init];
       newCity.name=@"test";
        newCity.population=1000;
        [self.allCities addObject:newCity];
        
        
    //2.刷新界面
//        [tableView reloadData];
        NSIndexPath *newIndexPath=[NSIndexPath indexPathForRow:self.allCities.count-1 inSection:0];
        
        [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationTop];
        
    }
}











#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.allCities.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    City *city=self.allCities[indexPath.row];
    
    cell.textLabel.text=city.name;
    
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
