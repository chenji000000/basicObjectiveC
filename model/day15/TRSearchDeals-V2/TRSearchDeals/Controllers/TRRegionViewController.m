//
//  TRRegionViewController.m
//  TRSearchDeals
//
//  Created by tarena on 15/11/23.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "TRRegionViewController.h"
#import "TRMetaDataTool.h"
#import "TRRegion.h"


@interface TRRegionViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (weak, nonatomic) IBOutlet UITableView *subTableView;
@property (nonatomic, strong) NSArray *regionArray;

@end

@implementation TRRegionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.创建TRRegion.h/.m（name;subregions）
    TRRegion *region=[TRRegion new];
    //2.NSArray *regionArray=[TRMetaDataTool regionsByCityName:@"北京"];
    self.regionArray=[TRMetaDataTool regionsByCityName:@"北京"];
    
    //3.使用regionArray给两个tableView赋值
    
}


- (IBAction)changeCity:(id)sender {
}

#pragma mark---tableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView=) {
        <#statements#>
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
