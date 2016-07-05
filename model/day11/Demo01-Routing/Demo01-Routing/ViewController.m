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

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *sourceTextField;
@property (weak, nonatomic) IBOutlet UITextField *targetTextField;
@property (nonatomic,strong) CLGeocoder *geocoder;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)startRouting:(id)sender {
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
    
    
//切换Maps到进行导航
    [MKMapItem openMapsWithItems:@[sourceItem,targetItem] launchOptions:@{
          MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving,MKLaunchOptionsMapTypeKey:@(MKMapTypeHybrid)                                                    }];
}

@end
