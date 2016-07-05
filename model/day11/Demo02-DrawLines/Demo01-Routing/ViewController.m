//
//  ViewController.m
//  Demo01-Routing
//
//  Created by tarena on 15/11/17.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface ViewController ()<MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *sourceTextField;
@property (weak, nonatomic) IBOutlet UITextField *targetTextField;
@property (nonatomic,strong) CLGeocoder *geocoder;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)startRouting:(id)sender {
    
    //设置地图视图代理
    self.mapView.delegate=self;
    
    
    //给定城市的名字——>经纬度（地理编码）CLGeocoder
    //初始化geocoder变量
    self.geocoder=[CLGeocoder new];
    [self.geocoder geocodeAddressString:self.sourceTextField.text completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (!error) {
            CLPlacemark *sourcePlacemark=[placemarks firstObject];
            //仍然使用geocoder变量对终点执行地理编码
            [self.geocoder geocodeAddressString:self.targetTextField.text completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
                CLPlacemark *targetPlacemark=[placemarks firstObject];
                //开始导航
                [self navigateWithSource:sourcePlacemark withTarget:targetPlacemark];
            }];
        }
    }];
}
-(void)navigateWithSource:(CLPlacemark *)sourcePlacemark withTarget:(CLPlacemark *)targetPlacemark{
    MKPlacemark *sourceMKPlacemark=[[MKPlacemark alloc] initWithPlacemark:sourcePlacemark];
    MKMapItem *sourceItem=[[MKMapItem alloc] initWithPlacemark:sourceMKPlacemark];
    
    MKPlacemark *targetMKPlacemark=[[MKPlacemark alloc] initWithPlacemark:targetPlacemark];
    MKMapItem *targetItem=[[MKMapItem alloc] initWithPlacemark:targetMKPlacemark];
    
    
//切换Maps应用到进行导航
    MKDirectionsRequest *request=[MKDirectionsRequest new];
    request.source=sourceItem;
    request.destination=targetItem;
    MKDirections *directions=[[MKDirections alloc] initWithRequest:request];
    //执行请求
    [directions calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse * _Nullable response, NSError * _Nullable error) {
        if (!error) {
            //从response对象获取Route信息
            NSArray *routesArray=response.routes;
            for (MKRoute *route in routesArray) {
                //画线(在地图视图上)
                [self.mapView addOverlay:route.polyline];
                //打印steps(Route对应的小步骤)
                for (MKRouteStep *step in route.steps) {
                    NSLog(@"每个step描述:%@",step.instructions);
                }
            }
        }
    }];
   
}

//告诉遮盖颜色/粗细
-(MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay{
    MKPolylineRenderer *polyline=[[MKPolylineRenderer alloc] initWithPolyline:overlay];
    polyline.lineWidth=5;
    polyline.strokeColor=[UIColor redColor];
    
    return polyline;
}

@end
