//
//  MBProgressHUD+LBX.m
//  Demo
//
//  Created by csc on 16/1/7.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "MBProgressHUD+LBX.h"

@implementation MBProgressHUD (LBX)

+ (void)showHudWithMessage:(NSString*)message icon:(UIImage*)icon onView:(UIView*)view
{
    if (view == nil) {
        return;
    }
    
    MBProgressHUD* tmp = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    if (icon) {
        // 设置图片
        tmp.customView = [[UIImageView alloc] initWithImage:icon];
        // 再设置模式
        tmp.mode = MBProgressHUDModeCustomView;
    }
    
    //tmp.detailsLabelText = @"加载中";
    tmp.labelText = message;
    tmp.removeFromSuperViewOnHide = YES;
    
    CGFloat delayTime = MIN((float)message.length*0.06 + 0.3, 5.0);
    [tmp hide:YES afterDelay:delayTime];
}


+ (void)showHudWithMessage:(NSString*)message icon:(UIImage*)icon onView:(UIView*)view afterDelay:(NSTimeInterval)delay
{
    if (view == nil) {
        return;
    }
    
    MBProgressHUD* tmp = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    if (icon) {
        // 设置图片
        tmp.customView = [[UIImageView alloc] initWithImage:icon];
        // 再设置模式
        tmp.mode = MBProgressHUDModeCustomView;
    }
    
    //tmp.detailsLabelText = @"加载中";
    tmp.labelText = message;
    tmp.removeFromSuperViewOnHide = YES;
    
    [tmp hide:YES afterDelay:delay];
}


+ (void)showErrorMessage:(NSString *)error onView:(UIView *)view{
   // [self show:error icon:@"error.png" view:view];
    
    UIImage *icon = [UIImage imageNamed:@"MBProgressHUD.bundle/error.png"];
    
    [self showHudWithMessage:error icon:icon onView:view];
}

+ (void)showErrorMessage:(NSString *)error onView:(UIView *)view afterDelay:(NSTimeInterval)delay
{
    // [self show:error icon:@"error.png" view:view];
    
    UIImage *icon = [UIImage imageNamed:@"MBProgressHUD.bundle/error.png"];
    
    [self showHudWithMessage:error icon:icon onView:view afterDelay:delay];
}

+ (void)showErrorMessage:(NSString *)error onView:(UIView *)view afterDelay:(NSTimeInterval)delay finish:(void(^)())block
{
    UIImage *icon = [UIImage imageNamed:@"MBProgressHUD.bundle/error.png"];
    
    [self showHudWithMessage:error icon:icon onView:view afterDelay:delay];
    
    if (block) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            block();
        });
    }
}

+ (void)showSuccessMessage:(NSString *)success onView:(UIView *)view{
    // [self show:error icon:@"error.png" view:view];
    
    UIImage *icon = [UIImage imageNamed:@"MBProgressHUD.bundle/success.png"];
    
    [self showHudWithMessage:success icon:icon onView:view];
}

+ (void)showSuccessMessage:(NSString *)success onView:(UIView *)view afterDelay:(NSTimeInterval)delay{
    // [self show:error icon:@"error.png" view:view];
    
    UIImage *icon = [UIImage imageNamed:@"MBProgressHUD.bundle/success.png"];
    
    [self showHudWithMessage:success icon:icon onView:view afterDelay:delay];
}

+ (void)showSuccessMessage:(NSString *)success onView:(UIView *)view afterDelay:(NSTimeInterval)delay finish:(void(^)())block{
    // [self show:error icon:@"error.png" view:view];
    
    UIImage *icon = [UIImage imageNamed:@"MBProgressHUD.bundle/success.png"];
    
    [self showHudWithMessage:success icon:icon onView:view afterDelay:delay];
    
    if (block) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            block();
        });
    }
}

+ (void)showTipMessage:(NSString*)message onView:(UIView*)view
{
    UIImage *icon = [UIImage imageNamed:@"MBProgressHUD.bundle/error.png"];
    
    [self showHudWithMessage:message icon:icon onView:view];
}

+ (void)showTipMessage:(NSString*)message onView:(UIView*)view afterDelay:(NSTimeInterval)delay
{
    UIImage *icon = [UIImage imageNamed:@"MBProgressHUD.bundle/error.png"];
    
    [self showHudWithMessage:message icon:icon onView:view afterDelay:delay];
}

+ (void)showWaitingWithMessage:(NSString*)message onView:(UIView*)view
{
    MBProgressHUD* tmp = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    tmp.labelText = message;
    tmp.removeFromSuperViewOnHide = YES;
}

//隐藏最先找到的hud
+ (void)dismissWaitingWithView:(UIView*)view
{
    [MBProgressHUD hideHUDForView:view animated:YES];
}

//隐藏所有的hud
+ (void)dismissAllHuds:(UIView*)view
{
    [MBProgressHUD hideAllHUDsForView:view animated:YES];
}



@end
