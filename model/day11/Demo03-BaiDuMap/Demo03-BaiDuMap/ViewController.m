//
//  ViewController.m
//  Demo03-BaiDuMap
//
//  Created by chenji on 15/11/17.
//  Copyright © 2015年 chenji. All rights reserved.
//
//POI搜索功能
#import "ViewController.h"
#import <BaiduMapAPI_Map/BMKMapView.h>
#import <BaiduMapAPI_Map/BMKPointAnnotation.h>
#import <BaiduMapAPI_Search/BMKPoiSearch.h>

@interface ViewController ()<BMKMapViewDelegate,BMKPoiSearchDelegate>
@property (nonatomic, strong) BMKMapView *mapView;
@property (nonatomic, strong) BMKPoiSearch *poiSearch;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化mapView/poiSearch
    self.poiSearch=[[BMKPoiSearch alloc] init];
    self.mapView=[[BMKMapView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:self.mapView];
    
    //在mapView上添加UIButton
    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    button.center = CGPointMake(100, 200);
    [button addTarget:self action:@selector(clickAddButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    //设置poi的delegate
    self.poiSearch.delegate=self;
}

- (void)clickAddButton{
    //创建BMKCitySearchOption对象
    BMKCitySearchOption *option=[[BMKCitySearchOption alloc] init];
    //设置属性（pageIndex;pageCapacity;city;keyword）
    option.city=@"武汉";
    option.keyword=@"atm";
    option.pageIndex=0;
    option.pageCapacity=50;
    //发送请求
    BOOL isSuccess=[self.poiSearch poiSearchInCity:option];
    if (isSuccess) {
        NSLog(@"检索成功");
    }
}

- (void)onGetPoiResult:(BMKPoiSearch *)searcher result:(BMKPoiResult *)poiResult errorCode:(BMKSearchErrorCode)errorCode{
    if (errorCode==BMK_SEARCH_NO_ERROR) {
        //从poiResult中获取服务器返回的数据
        NSArray *poiArray=poiResult.poiInfoList;
        //循环添加大头针
        for (BMKPoiInfo *info in poiArray) {
            BMKPointAnnotation *annotation=[BMKPointAnnotation new];
            annotation.coordinate=info.pt;
            annotation.title=info.name;
            //添加到地图视图上
            [self.mapView addAnnotation:annotation];
        }
    }
}

@end
