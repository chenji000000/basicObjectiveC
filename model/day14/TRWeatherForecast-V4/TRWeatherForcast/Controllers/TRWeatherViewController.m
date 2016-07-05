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
#import "UIImageView+WebCache.h"
#import <CoreLocation/CoreLocation.h>
#import "AFNetworking.h"

@interface TRWeatherViewController ()<UITableViewDataSource, UITableViewDelegate,CLLocationManagerDelegate>
@property (nonatomic, strong) UIImageView *backgroundImageView;
@property (nonatomic, strong) UITableView *tableView;
//每小时数据
@property (nonatomic, strong) NSArray *hourlyArray;
//每天数据
@property (nonatomic, strong) NSArray *dailyArray;
//HeaderView
@property (nonatomic, strong) TRHeaderView *headerView;
//NSOperationQueue
@property (nonatomic, strong) NSOperationQueue *queue;
//存储已经下载好的图片
@property (nonatomic, strong) NSMutableDictionary *imagesDic;
//CLLocationManager
@property (nonatomic, strong) CLLocationManager *manager;
//用户位置
@property (nonatomic, strong) CLLocation *userLocation;
@property (nonatomic, strong) CLGeocoder *geocoder;


@end

@implementation TRWeatherViewController

-(CLGeocoder *)geocoder
{
    if (!_geocoder) {
        _geocoder=[CLGeocoder new];
    }
    return _geocoder;
}

-(CLLocationManager *)manager
{
    if (!_manager) {
        _manager=[CLLocationManager new];
    }
    return _manager;
}

- (NSMutableDictionary *)imagesDic
{
    if (!_imagesDic) {
        _imagesDic=[NSMutableDictionary dictionary];
    }
    return _imagesDic;
}

-(NSOperationQueue *)queue
{
    if (!_queue) {
        //非主队列
        _queue=[[NSOperationQueue alloc] init];
    }
    return _queue;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化背景/tableView
    [self setupBackgroundAndTableView];
    
    //初始化头部视图HeaderView
    [self setupHeaderView];
    
    //开始定位
    [self startUpdateLocation];
    
//    //获取服务器数据（JSON）(NSURLSession)
//    [self getJSONFromServer];
}

-(void)startUpdateLocation{
    //设置代理
    self.manager.delegate=self;
    //征求用户同意(iOS8+/Info.plist)
    [self.manager requestWhenInUseAuthorization];
}

#pragma mark---CLLocationManagerDelegate
-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    switch (status) {
        case kCLAuthorizationStatusAuthorizedWhenInUse:
            //用户同意定位
            [self.manager startUpdatingLocation];
            break;
        case kCLAuthorizationStatusDenied:
            //用户不同意（第二套方案：简单的推送一个默认的城市）
            self.userLocation=nil;
            //发送请求
            [self getJSONFromServer];
            break;
        default:
            break;
    }
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    self.userLocation=[locations lastObject];
    
    //停止定位
    [self.manager stopUpdatingLocation];
    
    //发送请求
    [self getJSONFromServer];
}

- (void)setupHeaderView
{
//五个控件（4个UILabel/UIImageView）
    self.headerView=[[TRHeaderView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.tableView.tableHeaderView=self.headerView;
    
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
    
    //1.创建操作管理对象
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //2.执行get方法(发送请求)
     NSString *urlStr=nil;
    if (self.userLocation) {
        //已经定位用户的位置
        urlStr=[NSString stringWithFormat:@"http://api.worldweatheronline.com/free/v2/weather.ashx?q=%f,%f&num_of_days=5&format=json&tp=6&key=23d22bdd0202032f73c9c3e1851dd",self.userLocation.coordinate.latitude,self.userLocation.coordinate.longitude];
       
        
    }else{
        
        urlStr=@"http://api.worldweatheronline.com/free/v2/weather.ashx?q=beijing&num_of_days=5&format=json&tp=6&key=23d22bdd0202032f73c9c3e1851dd";
    }
    [manager GET:urlStr parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
       
        //解析每小时和每天需要的数据(子线程)
        self.hourlyArray=[self weatherFromJson:responseObject isHourly:YES];
        self.dailyArray=[self weatherFromJson:responseObject isHourly:NO];
        //解析HeaderView需要数据
        [self parseAndUpdateHeaderView:responseObject];
        
        //回到主线程刷新tableView
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        //请求失败（TSMessage）
        //回到主线程显示消息框
        dispatch_async(dispatch_get_main_queue(), ^{
            [TSMessage showNotificationWithTitle:@"提示:" subtitle:@"请查看您的网络" type:TSMessageNotificationTypeWarning];
        });
    }];

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

- (void)parseAndUpdateHeaderView:(NSDictionary *)jsonDic{
    //解析jsonDic（模型层/子线程）
    TRWeather *weather=[TRWeather weatherWithHeaderViewDic:jsonDic];
    //反地理编码
    
    if (self.userLocation) {
        [self.geocoder reverseGeocodeLocation:self.userLocation completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
            if (!error) {
                CLPlacemark *placemark=[placemarks firstObject];
                self.headerView.cityLabel.text=placemark.addressDictionary[@"City"];
            }
        }];
    }else{
    self.headerView.cityLabel.text=@"beijing";
    }
    
    
    //更新头部视图控件（4个UILabel）
    dispatch_async(dispatch_get_main_queue(), ^{
        
        self.headerView.conditionsLabel.text=weather.weatherDesc;
        self.headerView.temperatureLabel.text=weather.currentTemp;
        self.headerView.hiloLabel.text=[NSString stringWithFormat:@"%@˚/%@˚", weather.minTemp,weather.maxTemp];
        //天气图标（开始下载图片）
        NSData *imageData=[NSData dataWithContentsOfURL:weather.iconURL];
        self.headerView.iconView.image=[UIImage imageWithData:imageData];
    });
    
}

#pragma mark---UITableViewDataSourceDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return section == 0 ? self.hourlyArray.count + 1 : self.dailyArray.count + 1;
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
        if (indexPath.row==0) {
            cell.textLabel.text=@"Hourly Information";
            //设置detailTextLabel文本为空(防止重用非0行的cell)
            cell.detailTextLabel.text=nil;
            cell.imageView.image=nil;
        }else{
        //数据来源
            TRWeather *weather=self.hourlyArray[indexPath.row-1];
            [self configCell:cell withWeather:weather isHourly:YES];
        }
    }else{
    //每天
        if (indexPath.row==0) {
            cell.textLabel.text=@"Daily Information";
            cell.detailTextLabel.text=nil;
            cell.imageView.image=nil;
        }else{
            //数据来源
            TRWeather *weather=self.dailyArray[indexPath.row-1];
            [self configCell:cell withWeather:weather isHourly:NO];
        }
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger cellCount= [self tableView:tableView numberOfRowsInSection:indexPath.section];
    return [UIScreen mainScreen].bounds.size.height/cellCount;
}

#pragma mark---设置cell
- (void)configCell:(UITableViewCell *)cell withWeather:(TRWeather *)weather isHourly:(BOOL)isHourly{
    //cell字体/颜色
    cell.textLabel.textColor=[UIColor whiteColor];
    cell.detailTextLabel.textColor=[UIColor whiteColor];
    //textLabel文本
    cell.textLabel.text=isHourly?weather.time:weather.date;
    //detailTextLabel文本
    cell.detailTextLabel.text=isHourly?weather.currentTemp:[NSString stringWithFormat:@"%@˚/%@˚", weather.minTemp,weather.maxTemp];
    
    //使用SDWebImage来下载图片
    [cell.imageView sd_setImageWithURL:weather.iconURL placeholderImage:[UIImage imageNamed:@"placeholder.png"]];

}

//接收系统内存警告的方法
- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    //释放资源(imagesDic)
    [self.imagesDic removeAllObjects];
    //非主队列中可能包含很多没有执行的操作，取消所有的操作
    [self.queue cancelAllOperations];
}
//在tableView将要滚动的时候，暂停所有的下载操作
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.queue setSuspended:YES];
}
//不滚动的时候，继续下载
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self.queue setSuspended:NO];
}



@end
