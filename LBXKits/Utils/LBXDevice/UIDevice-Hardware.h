/*
 Erica Sadun, http://ericasadun.com
 iPhone Developer's Cookbook, 5.0 Edition
 BSD License, Use at your own risk
 */

#import <UIKit/UIKit.h>




@interface Hardware:UIDevice

/**
 @brief 硬件号类型
 @return 硬件类型
 */
+ (NSString *) platform;

/**
 @brief platform返回的类型，转换为iphone4,iphone6，没新发布一个设备，需要更新代码，不建议使用，使用platform存在后台即可
 @return ios设备名称，如iphone5,iphong6
 */
+ (NSString *) platformString;

+ (NSString *) hwmodel;



+ (NSUInteger) cpuFrequency;
+ (NSUInteger) busFrequency;
+ (NSUInteger) totalMemory;
+ (NSUInteger) userMemory;

+ (NSNumber *) totalDiskSpace;
+ (NSNumber *) freeDiskSpace;

//mac地址，ios5还是ios6之后已经不支持
+ (NSString *) macaddress;

@end

