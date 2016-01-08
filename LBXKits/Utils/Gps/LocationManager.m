//
//  LocationManager.m
//  
//
//  Created by lbxia on 15/7/13.
//
//

#import "LocationManager.h"
#import <CoreLocation/CoreLocation.h>

@interface LocationManager()<CLLocationManagerDelegate>
@property(nonatomic,strong) CLLocationManager *locationManager;

@property(nonatomic,copy)void(^success)(CLLocation* currentLocation);

@property(nonatomic,copy)void(^fail)(NSError* error);

@end


@implementation LocationManager


+ (instancetype)sharedManager
{
    static LocationManager* _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[LocationManager alloc] init];
    });
    
    return _sharedInstance;
}

+ (BOOL)isLocationServicesEnabled
{
    return [CLLocationManager locationServicesEnabled];
}

+ (BOOL)isGetGpsPermission
{
    if ((![CLLocationManager locationServicesEnabled])
        || ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusRestricted)
        || ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied))
    {
        return NO;
    }
    
    return YES;
}



//GPS
- (void)startGps:(void(^)(CLLocation* currentLocation))success fail:(void(^)(NSError* error))fail
{
    
//    kCLAuthorizationStatusRestricted,
//    
//    // User has explicitly denied authorization for this application, or
//    // location services are disabled in Settings.
//    kCLAuthorizationStatusDenied,
    
    
    if (![[self class]isLocationServicesEnabled] || ![[self class]isGetGpsPermission] ) {
        
        if (fail) {
            fail(nil);
        }
        return;
    }
    
    [self stopGps];
    
    self.success = success;
    self.fail = fail;
    
    [self startGps];
}

- (void)startGps
{
    
    if ( self.locationManager != nil ) {
        [self stopGps];
        return;
    }
    
    self.locationManager = [[CLLocationManager alloc] init];
    _locationManager.delegate=self;
    _locationManager.desiredAccuracy=kCLLocationAccuracyBestForNavigation;
    
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0 &&
        [CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined) {
        BOOL hasAlwaysKey = [[NSBundle mainBundle]
                             objectForInfoDictionaryKey:@"NSLocationAlwaysUsageDescription"] != nil;
        BOOL hasWhenInUseKey =
        [[NSBundle mainBundle] objectForInfoDictionaryKey:@"NSLocationWhenInUseUsageDescription"] !=
        nil;
        if (hasAlwaysKey) {
            [_locationManager requestAlwaysAuthorization];
        } else if (hasWhenInUseKey) {
            [_locationManager requestWhenInUseAuthorization];
        } else {
            // At least one of the keys NSLocationAlwaysUsageDescription or
            // NSLocationWhenInUseUsageDescription MUST be present in the Info.plist
            // file to use location services on iOS 8+.
            NSAssert(hasAlwaysKey || hasWhenInUseKey,
                     @"To use location services in iOS 8+, your Info.plist must "
                     @"provide a value for either "
                     @"NSLocationWhenInUseUsageDescription or "
                     @"NSLocationAlwaysUsageDescription.");
        }
    }
    
   
    if ([[self class]isGetGpsPermission]) {
     
        [self.locationManager startUpdatingLocation];
    }
    else
    {
        if (_fail) {
            _fail(nil);
        }
    }
    
    
}



- (void)stopGps
{
    if ( self.locationManager )
    {
        [_locationManager stopUpdatingLocation];
        self.locationManager = nil;
        
        self.success = nil;
        self.fail = nil;
    }
}

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    //CLLocationCoordinate2D coordinate = [newLocation coordinate];
    
   //调用者负责停止GPS
   // [self stopGps];
    
    CLLocationCoordinate2D coordinate = [newLocation coordinate];
    _latitude = coordinate.latitude;
    _longtitude = coordinate.longitude;
    
    NSLog(@"%f,%f",_longtitude,_latitude);
    
    if (_success)
    {
        _success(newLocation);
    }
}



////------------------位置反编码---5.0之后使用-----------------
//CLGeocoder *geocoder = [[CLGeocoder alloc] init];
//[geocoder reverseGeocodeLocation:newLocation
//               completionHandler:^(NSArray *placemarks, NSError *error){
//
//                   for (CLPlacemark *place in placemarks) {
//                       UILabel *label = (UILabel *)[self.window viewWithTag:101];
//                       label.text = place.name;
//                       NSLog(@"name,%@",place.name);                       // 位置名
//                       //                           NSLog(@"thoroughfare,%@",place.thoroughfare);       // 街道
//                       //                           NSLog(@"subThoroughfare,%@",place.subThoroughfare); // 子街道
//                       //                           NSLog(@"locality,%@",place.locality);               // 市
//                       //                           NSLog(@"subLocality,%@",place.subLocality);         // 区
//                       //                           NSLog(@"country,%@",place.country);                 // 国家
//                   }
//
//               }];

/**
 @brief 转换GPS->城市名称
 @param currentLocation 当前坐标
 @param success         返回结果
 */
+ (void)converseGps:(CLLocation*) currentLocation
         success:(void (^)(CLPlacemark *placemark))success
               fail:(void(^)(NSError* error))fail
{
    // 获取当前所在的城市名
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    //根据经纬度反向地理编译出地址信息
    [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *array, NSError *error)
     {
         if (array.count > 0)
         {
             CLPlacemark *placemark = [array objectAtIndex:0];
             
             if (success) {
                 success(placemark);
             }
             
         }
         else
         {
             if (fail) {
                 fail(error);
             }
         }
     }];
}


-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    [self stopGps];
}


- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    NSLog(@"GPS error:%@",error);
    
    if (_fail) {
        _fail(error);
    }
}


@end
