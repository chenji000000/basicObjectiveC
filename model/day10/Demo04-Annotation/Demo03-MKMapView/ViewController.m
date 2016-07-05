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
    //设置用户位置两个文本(蓝色圈)
    userLocation.title=@"用户位置";
    userLocation.subtitle=@"用户子文本";
    
//已经定位到用户的位置
    NSLog(@"location:%f,%f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
}



//默认情况下返回nil
//1).地图视图上有多少个大头针，就调用多少次
//2).当大头针对象添加到地图视图上就会调用该方法
-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    //4).把用户位置对应的蓝色圈所在位置排除出去
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    }
    
//需求：修改大头针的颜色（创建视图MKPinAnnotationView）
    //3).需要MKPinAnnotationView的重用机制
    //声明静态的标签
    static NSString *identifier=@"annotation";
    //从缓存池中获取一个对象
    MKPinAnnotationView *annotationView=(MKPinAnnotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    //缓冲池中如果没有创建对象
    if (!annotationView) {
        annotationView=[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        //5).设置显示弹出框的属性
        annotationView.canShowCallout=YES;
        //设置颜色(RGB)
        annotationView.pinTintColor=[UIColor blueColor];
        //设置从天而降的动画
        annotationView.animatesDrop=YES;
        //设置左边和右边辅助视图（accessoryView）
        annotationView.leftCalloutAccessoryView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"array.png"]];
        annotationView.rightCalloutAccessoryView=[UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        annotationView.backgroundColor=[UIColor redColor];
    }else{
    //有可重用的大头针视图，将annotation赋值annotationView
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
    //3.添加到地图视图
    [self.mapView addAnnotation:annotation];
    
    //设置地图显示的区域（让用户看到那块区域）
    //跨度
    MKCoordinateSpan span=MKCoordinateSpanMake(0.5, 0.5);
    MKCoordinateRegion region=MKCoordinateRegionMake(annotation.coordinate, span);
    [self.mapView setRegion:region animated:YES];
    
}

@end
