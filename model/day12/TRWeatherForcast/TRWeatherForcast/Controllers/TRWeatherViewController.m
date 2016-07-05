//
//  TRWeatherViewController.m
//  TRWeatherForcast
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "TRWeatherViewController.h"
#import "TRHeaderView.h"
#import "TSMessage.h"
#import "TSMessageView.h"
#import "TRWeather.h"

@interface TRWeatherViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UIImageView *backgroundImageView;
@property (nonatomic, strong) UITableView *tableView;
//每小时数据
@property (nonatomic, strong) NSArray *hourlyArray;
//每天数据
@property (nonatomic, strong) NSArray *dailyArray;
@end

@implementation TRWeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化背景/tableView
    [self setupBackgroundAndTableView];
    //初始化头部视图HeaderView
    [self setupHeaderView];
    
    //获取服务器数据（JSON）(NSURLSession)
    [self getJSONFromServer];
}

- (void)setupHeaderView
{
//五个控件（4个UILabel/UIImageView）
    TRHeaderView *headerView=[[TRHeaderView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.tableView.tableHeaderView=headerView;
    
}

- (void)setupBackgroundAndTableView{
    //背景 (self.view.bounds)
    CGRect bounds=[UIScreen mainScreen].bounds;
    self.backgroundImageView=[[UIImageView alloc] initWithFrame:bounds];
    self.backgroundImageView.image=[UIImage imageNamed:@"bg.png"];
    [self.view addSubview:self.backgroundImageView];
    
    //tableView
    self.tableView=[[UITableView alloc] initWithFrame:bounds];
    self.tableView.backgroundColor=[UIColor clearColor];
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    
    //设定tableView分割线的颜色
    self.tableView.separatorColor=[UIColor colorWithWhite:1 alpha:0];
    //设置Page属性(按照section来滚动)
    self.tableView.pagingEnabled=YES;
    
    [self.view addSubview:self.tableView];

}

#pragma mark---获取JSON数据
- (void)getJSONFromServer
{
    //设定弹出消息框的缺省(默认)视图控制器
    [TSMessage setDefaultViewController:self];
    //url/request
    NSURL *url=[NSURL URLWithString:@"http://api.worldweatheronline.com/free/v2/weather.ashx?q=beijing&num_of_days=5&format=json&tp=6&key=23d22bdd0202032f73c9c3e1851dd"];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    //session
    //task
    NSURLSessionDataTask *task=[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSInteger statusCode=[(NSHTTPURLResponse *)response statusCode];
        if (statusCode == 200) {
            //NSData——>JSON Object——>OC对象
            NSDictionary *jsonDic=[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            //JSON数据的解析（模型类）
            //解析每小时和每天需要的数据(子线程)
            self.hourlyArray=[self weatherFromJson:jsonDic isHourly:YES];
            self.dailyArray=[self weatherFromJson:jsonDic isHourly:NO];
            
        }else{
        //请求失败（TSMessage）
            //回到主线程显示消息框
            dispatch_async(dispatch_get_main_queue(), ^{
                [TSMessage showNotificationWithTitle:@"提示:" subtitle:@"请查看您的网络" type:TSMessageNotificationTypeWarning];
            });
        }
    }];
    //执行task
    [task resume];
}

- (NSArray *)weatherFromJson:(NSDictionary *)jsonDic isHourly:(BOOL)isHourly
{
    //原始每天数据
    NSDictionary *dataDic=jsonDic[@"data"];
    NSArray *dailyArray=dataDic[@"weather"];
    //原始每小时数据
    NSArray *hourlyArray=dailyArray[0][@"hourly"];
    
    //可变数组
    NSMutableArray *dailyMutableArray=[NSMutableArray array];
    NSMutableArray *hourlyMutableArray=[NSMutableArray array];
    
    if (isHourly) {
        //每小时数据
        for (NSDictionary *hourlyDic in hourlyArray) {
            TRWeather *weather=[TRWeather weatherWithHourlyDic:hourlyDic];
            [hourlyMutableArray addObject:weather];
        }
    }else{
        //每天数据
        for (NSDictionary *dailyDic in dailyArray) {
            TRWeather *weather=[TRWeather weatherWithDailyDic:dailyDic];
            [dailyMutableArray addObject:weather];
        }
    }
    //三目（元）运算符
    return isHourly?[hourlyMutableArray copy]:[dailyMutableArray copy];
}


#pragma mark---UITableViewDataSourceDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning TODO:行数
    return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
static NSString *identifier=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    
    //设置cell
    //背景颜色
    cell.backgroundColor=[UIColor colorWithWhite:0 alpha:0.2];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.textLabel.textColor=[UIColor whiteColor];
    
    //文本
    if (indexPath.section==0) {
        //每小时
        #warning TODO:设置每小时
        cell.textLabel.text=@"hourly";
    }else{
    //每天
        #warning TODO:设置每天
        cell.textLabel.text=@"Daily";
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
 #warning TODO:设置行高
    return 44;
}













@end
