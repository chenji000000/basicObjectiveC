//
//  ContactTableViewController.m
//  Demo01-CoreData-Contact
//
//  Created by tarena on 15/11/30.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "ContactTableViewController.h"
#import <CoreData/CoreData.h>
#import "Contact.h"
#import "AppDelegate.h"
#import "AddContactViewController.h"

@interface ContactTableViewController ()<NSFetchedResultsControllerDelegate>
//上下文对象
@property (nonatomic, strong) NSManagedObjectContext *context;
//结果控制器对象
@property (nonatomic, strong) NSFetchedResultsController *resultsController;
@end

@implementation ContactTableViewController

- (NSManagedObjectContext *)context
{
    if (!_context) {
        //获取AppDelegate对象
        AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
        _context = delegate.managedObjectContext;
    }
    return _context;
}
//初始化结果控制器
- (NSFetchedResultsController *)resultsController
{
    if (_resultsController) {
        return _resultsController;
    }
    //如果该对象为空，进行初始化
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    //创建描述实体的对象，和request绑定
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Contact" inManagedObjectContext:self.context];
    request.entity = entityDesc;
    //！！！！必须设定返回的数据按照什么进行排序（NSSortDescriptor）
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    request.sortDescriptors = @[sortDescriptor];
    /*第三个参数：指定返回结果是按照那一列区分section
     第四个参数：缓存文件（夹）的名字（提高获取速度）
     */
    _resultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:self.context sectionNameKeyPath:@"name" cacheName:@"CacheData"];
    
    //执行request（监听数据库文件的变化）
    NSError *error = nil;
    if (![self.resultsController performFetch:&error]) {
        NSLog(@"执行request失败:%@",error.userInfo);
    }
    //监听数据库中数据的变化
    _resultsController.delegate = self;
    
    return _resultsController;
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"结果控制器：%@",self.resultsController);
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
     self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
}
- (IBAction)addContact:(id)sender {
    //创建添加好友视图控制器对象（参数：结果控制器）
    AddContactViewController *addContactViewController = [AddContactViewController new];
    addContactViewController.resultsController = self.resultsController;
    //显示
    [self presentViewController:addContactViewController animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark---ResultsControllerDelegate
//监听到将要发生变化
- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView beginUpdates];
}
//监听到数据库中数据变化导致section变化
- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id<NSFetchedResultsSectionInfo>)sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type
{
    switch (type) {
        case NSFetchedResultsChangeInsert:
            //插入一个section到tableView
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
        case NSFetchedResultsChangeDelete:
            //删除某个section
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        default:
            break;
    }
    
}
//监听到数据库中数据变化导致object变化
- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath
{
    switch (type) {
        case NSFetchedResultsChangeInsert:
            //插入一行到tableView
            [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
           case NSFetchedResultsChangeDelete:
            //删除那一行
            [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            case NSFetchedResultsChangeMove:
            //先将老的那行删除
            [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            //再将新行插入
            [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            case NSFetchedResultsChangeUpdate:
            //更新成更改以后的数据
            [self configCell:[self.tableView cellForRowAtIndexPath:indexPath] withIndexPath:indexPath];
            break;
        default:
            break;
    }
}
//监听到已经发生变化
- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView endUpdates];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//从结果控制器获取section个数
    return self.resultsController.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //从sections中获取section这一项的对应的信息（遵循NSFetchedResultsSectionInfo协议）
    id<NSFetchedResultsSectionInfo> sectionInfo = [self.resultsController.sections objectAtIndex:section];
    return [sectionInfo numberOfObjects];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"contact" forIndexPath:indexPath];
    
    // Configure the cell...
    [self configCell:cell withIndexPath:indexPath];
    
    return cell;
}

//设置cell的两个Label文本
- (void)configCell:(UITableViewCell *)cell withIndexPath:(NSIndexPath *)indexPath
{
    //数据来源
    Contact *contact = [self.resultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = contact.name;
    cell.detailTextLabel.text = contact.signature;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
//在tableView处于编辑状态下（删除）
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
       //获取要删除的对象
         Contact *contact = [self.resultsController objectAtIndexPath:indexPath];
        [self.context deleteObject:contact];
        //从数据库中将记录（对象）删除
        NSError *error = nil;
        if(![self.context save:&error])
        {
            NSLog(@"删除失败：%@",error.userInfo);
        }
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

//在tableView处于编辑状态下点中i（accessoryView）
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.editing) {
        //需求：需要更新当前行对应好友数据
        //数据来源
        Contact *contact = [self.resultsController objectAtIndexPath:indexPath];
        //创建AddContactViewController对象
        AddContactViewController *contactViewController = [AddContactViewController new];
        contactViewController.resultsController = self.resultsController;
        contactViewController.contact = contact;
        //显示
        [self presentViewController:contactViewController animated:YES completion:nil];
    }
}


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
