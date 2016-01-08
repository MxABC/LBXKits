//
//  LocationManager.h
//
//
//  Created by lbxia on 15/7/13.
//  Copyright (c) 2015年 lbxia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

/**
 @brief  GPS定位管理
 
 
 ios6或ios7添加  NSLocationUsageDescription 描述字段
 
 ios8之后添加如下2个字段
 info.plist配置文件中需要添加下面2个字段，string,可以添加描述内容，表示为什么要使用GPS坐标等
 
 NSLocationUsageDescription，添加该字段后，xcode6.4会显示成  Privacy - Location Usage Description,字段内容会显示在提示用户GPS权限的提示对话框上
 NSLocationWhenInUseUsageDescription
 */

@interface LocationManager : NSObject
@property(nonatomic,assign)double longtitude;
@property(nonatomic,assign)double latitude;

/**
 @brief  单例
 @return 单例对象
 */
+ (instancetype)sharedManager;


/**
 @brief 系统GPS是否开启
 @return 状态
 */
+ (BOOL)isLocationServicesEnabled;
/**
 @brief app是否有GPS权限,只要不是deny状态，默认认为是允许状态
 @return 状态
 */
+ (BOOL)isGetGpsPermission;

/**
 @brief 定位获取GPS坐标,返回GPS坐标后如果需要关闭GPS，请调用 stopGps 方法
 @param success 成功
 @param fail    失败
 */
- (void)startGps:(void(^)(CLLocation* currentLocation))success fail:(void(^)(NSError* error))fail;

/**
 @brief 转换GPS->城市名称和地址
 @param currentLocation 当前坐标
 @param success         返回转换结果
 @param fail            转换失败
 */
+ (void)converseGps:(CLLocation*) currentLocation
         toCityName:(void (^)(NSString* cityName,NSString* address))success
               fail:(void(^)(NSError* error))fail;


/**
 @brief  关闭GPS
 */
- (void)stopGps;


@end
