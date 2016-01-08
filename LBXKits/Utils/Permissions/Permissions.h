//
//  Permissions.h
//  
//
//  Created by lbxia on 15/4/20.
//  Copyright (c) 2015年 lbxia. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 @brief 获取各种设备、资源权限
 注：app运行期间设置里面更改相关权限，会导致app崩溃是系统造成的，待测试捕获异常看是否会仍然会导致app崩溃。
 
 GPS权限 在LocationManager中处理
 */
@interface Permissions : NSObject


/**
 @brief 获取相机权限
 @param completion 返回block，allowed:YES表示有权限，NO表示无权限
 */
+ (void)getCameraPermission:(nonnull void(^)(BOOL allowed))completion;


/**
 @brief 获取相册权限
 @param completion 返回block，allowed:YES表示有权限，NO表示无权限
 */
+ (void)getPhotoPermission:(nonnull void(^)(BOOL allowed))completion;


/**
 @brief 前往本app权限系统设置界面，需要ios8之后
 */
+ (void)openPermissionSetting;


//麦克风权限

//推送权限

//通讯录

//日历

//健康

//HomeKit

//蓝牙

@end



