//
//  ViewController.m
//  Demo03-MKMapView
//
//  Created by tarena on 15/11/16.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import "TRAnnotation.h"

//SDK


@interface ViewController ()<MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property(nonatomic,strong)CLLocationManager *manager;
@property(nonatomic,strong) CLGeocoder *geocoder;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化geocoder
    self.geocoder=[CLGeocoder new];
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
    //设置用户位置两个文本(蓝色圈)
//    userLocation.title=@"用户位置";
//    userLocation.subtitle=@"用户子文本";
    [self.geocoder reverseGeocodeLocation:userLocation.location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (!error) {
            CLPlacemark *placemark=[placemarks firstObject];
            userLocation.title=placemark.name;
            userLocation.subtitle=placemark.subLocality;
        }
    }];

    
    NSLog(@"location:%f,%f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
}



//默认情况下返回nil
-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    //把用户的位置对应的大头针对象排除
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    }
    //使用MKAnnotationView来实现自定义的大头针（设定图片）
    static NSString *identifier=@"annotationView";
    MKAnnotationView *annotationView=[self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (!annotationView) {
        annotationView=[[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        //设定是否显示弹出框
        annotationView.canShowCallout=YES;
        //设置左边的辅助视图
        annotationView.leftCalloutAccessoryView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"屏幕快照.png"]];
        //设定大头针视图的图片
        TRAnnotation *anno=(TRAnnotation *)annotation;
        annotationView.image=anno.image;
    }else{
    //有可用的
        annotationView.annotation=annotation;
    }
    return annotationView;
}

- (IBAction)addAnnotation:(id)sender {
    //1.创建自定义大头针模型对象
    TRAnnotation *annotation=[[TRAnnotation alloc] init];
    //2.设置三个属性
    //arc4random_uniform(x):产生0~x-1的随机数
    CGFloat latitude=38.123+arc4random_uniform(10);
    CGFloat longitude=119.102+arc4random_uniform(10);
    annotation.coordinate=CLLocationCoordinate2DMake(latitude, longitude);
    annotation.title=@"iOS1508";
    annotation.subtitle=@"Fighting";
    annotation.image=[UIImage imageNamed:@"test.png"];
    //3.添加到地图视图
    [self.mapView addAnnotation:annotation];
    
    //设置地图显示的区域（让用户看到那块区域）
    //跨度
    MKCoordinateSpan span=MKCoordinateSpanMake(0.5, 0.5);
    MKCoordinateRegion region=MKCoordinateRegionMake(annotation.coordinate, span);
    [self.mapView setRegion:region animated:YES];
    
}

@end
