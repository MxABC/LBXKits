//
//
//
//
//  Created by lbxia on 13-9-22.
//  Copyright (c) 2013年 . All rights reserved.
//

#import <Foundation/Foundation.h>


@interface LBXDeviceUtil : NSObject



/**
 @brief  CFUUIDCreate方法创建而成,并存储钥匙串，
  在bundleId不变以及证书不变的情况下，id不会修改。
 @return 设备ID，长度36位
 */
+ (NSString*)getUUID;


/**
 @brief  获取设备名称，如iphone5S,iphone6等，不过这里返回的不是直接iphone5S,iphone6,而是苹果的内部标识，后台根据对应标识匹配即可
 @return 设备名称
 */
+ (NSString*)getDeviceName;



@end
