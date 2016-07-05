//
//  ViewController.m
//  day06_iBeacon
//
//  Created by tarena on 15/12/19.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

//蓝牙服务的唯一标识
//32位   8-4-4-4-12
#define kUUID @"00000000-0000-0000-0000-000000000000"
//当前蓝牙的标识
#define kIdentifier @"SomeIdentifier"

@import CoreBluetooth;
@import CoreLocation;

@interface ViewController ()<CLLocationManagerDelegate, CBPeripheralManagerDelegate>
/** 向外广播的beacon */
@property (nonatomic, strong) CBPeripheralManager *peripheralManager;
/** beacon的范围 */
@property (nonatomic, strong) CLBeaconRegion *beaconRegion;
/** 定位管理 */
@property (nonatomic, strong) CLLocationManager *locationManager;
@end

@implementation ViewController

#pragma mark---定位服务
- (CLLocationManager *)locationManager
{
    if (!_locationManager) {
        
        _locationManager =[CLLocationManager new];
        _locationManager.delegate = self;
        //iOS8以后，定位服务需要用户许可
        if ([_locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
            //请求授权操作，需要修改info.plist文件
            [_locationManager requestAlwaysAuthorization];
        }
    }
    return _locationManager;
}
- (void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region
{
    NSLog(@"didExitRegion 退出某个区域");
}

- (void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region
{
    NSLog(@"didEnterRegion 进入某个区域");
}
- (void)locationManager:(CLLocationManager *)manager didDetermineState:(CLRegionState)state forRegion:(CLRegion *)region
{
    //在里面，在外面，未知
    NSLog(@"didDetermineState 状态的变更");
}

- (void)locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray<CLBeacon *> *)beacons inRegion:(CLBeaconRegion *)region
{
    NSLog(@"didRangeBeacons 获知beacon的距离 %@", beacons);
    for (CLBeaconRegion *region in beacons) {
        //可以获得每个region的详细参数
        //这个枚举变量，标志当前距离远/近/特别近/找不到
//        region.proximity
    }
}

#pragma mark---beacon类型
- (CLBeaconRegion *)beaconRegion
{
    if (!_beaconRegion) {
        NSUUID *preximityUUID = [[NSUUID alloc] initWithUUIDString:kUUID];
        _beaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:preximityUUID identifier:kIdentifier];
    }
    return _beaconRegion;
}

#pragma mark--用户点击操作

//检测
- (IBAction)monterning:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 0) {
        [self.locationManager stopMonitoringForRegion:self.beaconRegion];
    } else {
        [self.locationManager startMonitoringForRegion:self.beaconRegion];
    }
}

//定位,ranging 范围
- (IBAction)location:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 0) {
        [self.locationManager stopRangingBeaconsInRegion:self.beaconRegion];
    } else {
        [self.locationManager startRangingBeaconsInRegion:self.beaconRegion];
    }
}

//广播
- (IBAction)advertise:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 0) {
        [_peripheralManager stopAdvertising];
    } else {
        _peripheralManager = [[CBPeripheralManager alloc] initWithDelegate:self queue:nil options:nil];
    }
}
//当广播状态更新时触发
- (void)peripheralManagerDidUpdateState:(CBPeripheralManager *)peripheral
{
    //如果广播状态为开启
    if (peripheral.state == CBPeripheralManagerStatePoweredOn) {
        CLBeaconRegion *region = [[CLBeaconRegion alloc] initWithProximityUUID:self.beaconRegion.proximityUUID major:rand() minor:rand() identifier:kIdentifier];
        [_peripheralManager startAdvertising:[region peripheralDataWithMeasuredPower:nil]];
    }
}

#pragma mark---生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
