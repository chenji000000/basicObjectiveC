//
//  CityTableViewController.m
//  Demo5_动态表格
//
//  Created by tarena on 15/10/22.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "CityTableViewController.h"
#import "City.h"

@interface CityTableViewController ()
@property(nonatomic,strong) NSArray *allCities;

@end

@implementation CityTableViewController

-(NSArray *)allCities
{
    if (!_allCities) {
        _allCities=[City demoData];
        
    }
    return _allCities;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.allCities.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    if (indexPath.row%2==0) {
        cell=[tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
    }else{
    cell=[tableView dequeueReusableCellWithIdentifier:@"cell2" forIndexPath:indexPath];
    
    }
    
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
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
