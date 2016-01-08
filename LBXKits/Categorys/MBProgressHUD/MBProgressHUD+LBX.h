//
//  MBProgressHUD+LBX.h
//  
//
//  Created by lbxia on 16/1/7.
//  Copyright © 2016年 lbxia. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (LBX)


#pragma mark -显示提示，在一定时间内自动隐藏消失
/**
 @brief 显示提示文字在指定UIView上,延时消失时间根据message长度来自动计算
 @param message 消息内容
 @param icon    提示图标
 @param view    视图
 */
+ (void)showHudWithMessage:(NSString*)message icon:(UIImage*)icon onView:(UIView*)view;


/**
 @brief 显示提示文字在指定UIView上
 @param message 消息内容
 @param icon    提示图标
 @param view    视图
 @param delay   延时消失时间
 */
+ (void)showHudWithMessage:(NSString*)message icon:(UIImage*)icon onView:(UIView*)view afterDelay:(NSTimeInterval)delay;



/**
 @brief 显示错误提示消息
 @param error 错误信息内容
 @param view  视图
 */
+ (void)showErrorMessage:(NSString *)error onView:(UIView *)view;

/**
 @brief 显示错误提示消息
 @param error 错误信息内容
 @param view  视图
 @param delay 延时消失时间
 */
+ (void)showErrorMessage:(NSString *)error onView:(UIView *)view afterDelay:(NSTimeInterval)delay;

/**
 @brief 显示错误提示消息
 @param error 错误信息内容
 @param view  视图
 @param delay 延时消失时间
 @param block 显示结束block
 */
+ (void)showErrorMessage:(NSString *)error onView:(UIView *)view afterDelay:(NSTimeInterval)delay finish:(void(^)())block;

/**
 @brief 显示成功提示消息
 @param success 成功信息内容
 @param view    视图
 */
+ (void)showSuccessMessage:(NSString *)success onView:(UIView *)view;

/**
 @brief 显示成功提示消息
 @param success 成功信息内容
 @param view    视图
 @param delay   延时消失时间
 */
+ (void)showSuccessMessage:(NSString *)success onView:(UIView *)view afterDelay:(NSTimeInterval)delay;


/**
 @brief 显示成功提示消息
 @param success 成功信息内容
 @param view    视图
 @param delay   延时消失时间
 @param block   显示结束block
 */
+ (void)showSuccessMessage:(NSString *)success onView:(UIView *)view afterDelay:(NSTimeInterval)delay finish:(void(^)())block;

/**
 @brief 显示提示信息，与成功或失败的区别是，图标不同
 @param message 提示信息内容
 @param view    视图
 */
+ (void)showTipMessage:(NSString*)message onView:(UIView*)view;

/**
 @brief 显示提示信息，与成功或失败的区别是，图标不同
 @param message 提示信息内容
 @param view    视图
 @param delay   延时消失时间
 */
+ (void)showTipMessage:(NSString*)message onView:(UIView*)view afterDelay:(NSTimeInterval)delay;


#pragma mark -显示等待提示，直到主动调用隐藏消失代码才会消失
/**
 @brief 显示等待提示，一般网络请求中使用
 @param message 等待提示内容
 @param view    显示的视图
 */
+ (void)showWaitingWithMessage:(NSString*)message onView:(UIView*)view;


#pragma mark -主动隐藏消失代码
/**
 @brief 隐藏最早显示的Hud
 @param view 显示的视图
 */
+ (void)dismissWaitingWithView:(UIView*)view;

//隐藏所有的hud
/**
 @brief 隐藏view上的所有的Hud
 @param view 显示hud的view
 */
+ (void)dismissAllHuds:(UIView*)view;


@end



