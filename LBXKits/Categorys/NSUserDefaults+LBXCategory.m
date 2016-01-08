//
//  NSUserDefaults+Category.m
//  
//
//  Created by lbxia on 15/4/20.
//  Copyright (c) 2015年 lbxia. All rights reserved.
//

#import "NSUserDefaults+LBXCategory.h"

@implementation NSUserDefaults(LBXCategory)

////////////////////////   NSUserDefaults  程序内存取共用信息   /////////////////////////////////
+ (void)save:(id)strMsg forKey:(NSString *)strKey
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    //清空
    [ud removeObjectForKey:strKey];
    
    [ud setObject:strMsg forKey:strKey];
    
    [ud synchronize];
    
//    BOOL bRet =  [ud synchronize];
//    NSLog(@"saveNSUserInfo = %d",bRet);
}

+ (void)remove:(NSString*)strKey
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    //清空
    [ud removeObjectForKey:strKey];
    [ud synchronize];
}

+ (id)get:(NSString *)strKey
{
    return [[NSUserDefaults standardUserDefaults]objectForKey:strKey];
}

+ (void)saveBOOL:(BOOL)status forKey:(NSString*)strKey
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    //清空
    [ud removeObjectForKey:strKey];
    
    [ud setBool:status forKey:strKey];
    [ud synchronize];
}

+ (BOOL)getBOOLWithKey:(NSString*)strKey
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    
    return [ud boolForKey:strKey];
}


@end
