//
//  CityTableViewController.m
//  Demo1_数组模型
//
//  Created by tarena on 15/10/19.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "CityTableViewController.h"
#import "City.h"



@interface CityTableViewController ()

//增加存储数据的数组属性
@property(nonatomic,strong) NSArray *allCities;
@end

@implementation CityTableViewController

-(NSArray *)allCities
{
    if(!_allCities){
    
        _allCities=[City demoData];
    
    }
    return _allCities;


}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"城市列表";
    
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//分区数为allCities数组中的元素个数
    return self.allCities.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //1.根据当前正在询问的分区号，找到该分区对应的city对象
    City *city=self.allCities[section];
    //2.分区的行为就为，该分区City对象里面的subAreas的个数
    return city.subAreas.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell"];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"MyCell"];
    }
    
   //根据分区号，找到该分区对应的city对象
    
    City *city=self.allCities[indexPath.section];
    
    //根据行号，获取City中某一个subArea信息显示
    cell.textLabel.text=city.subAreas[indexPath.row];
    
    
    return cell;
}
//回答某一个分区的分区头信息
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
//1.分区号对应的City对象
    City *City=self.allCities[section];
 //2.将City的name作为本分区的头信息返回
    return City.name;
}
//回答某一个分区的分区尾信息
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
//1.按照分区号找到该分区对应的City对象
    City *city=self.allCities[section];
    //2.将City的population作为本分区的分区尾信息返回
    return [NSString stringWithFormat:@"人口数：%ld万",city.population];

}
@end
