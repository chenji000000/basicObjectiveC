//
//  ViewController.m
//  Demo03-MKMapView
//
//  Created by tarena on 15/11/16.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>

//SDK


@interface ViewController ()<MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property(nonatomic,strong)CLLocationManager *manager;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化manager
    self.manager=[CLLocationManager new];
    //征求用户同意（假定同意/Info.plist中key）
    [self.manager requestWhenInUseAuthorization];
    //设置代理
    self.mapView.delegate=self;
    
    //设置不允许旋转
    self.mapView.rotateEnabled=NO;
    
    //设置地图的显示类型(默认是standard类型)
    self.mapView.mapType=MKMapTypeStandard;
    
    
    //设定地图属性（开始定位/显示在地图上）
    self.mapView.userTrackingMode=MKUserTrackingModeFollow;
}

#pragma mark---MKMapViewDelegate
-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
//已经定位到用户的位置
    NSLog(@"location:%f,%f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
}

@end
