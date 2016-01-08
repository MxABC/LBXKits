//
//  
//
//
//  Created by lbxia on 13-9-22.
//  Copyright (c) 2013年 lbxia. All rights reserved.
//

#import "LBXDeviceUtil.h"
#import "KeychainItemWrapper.h"


#include <stdlib.h>
#import "UIDevice-Hardware.h"
#import <CommonCrypto/CommonDigest.h>


@implementation LBXDeviceUtil


+ (NSString*)getCurTime
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    // y-year M-month d-day H-hour m-minutes s:secodes s:miseconds  字符 /,: 任意修改
    [formatter setDateFormat:@"yyyyMMddHHmmssSSS"];
    NSString*timeString=[[formatter stringFromDate: [NSDate date]]copy];
    
    
    formatter = nil;
    
    return timeString;
}

/*
 int randomNum = arc4random() % 89999 + 10000;
 这是一个五位数的随机数；
 
 arc4random()%n 这是从0到(n-1)的随机数
 */


+ (NSString*)createDeviceID
{    
    //生成5位随机数
    int randomNum = arc4random() % 89999999 + 10000000;
    NSString *str = [NSString stringWithFormat:@"%d",randomNum];
    
    NSString *strTime = [self getCurTime];
    
    NSString *strID = [NSString stringWithFormat:@"%@%@",strTime,str];
 
  //  strID = [strID stringFromMD5];
   // DLog(@"%@",strID);
    
    //加密
    return strID;
}


+ (NSString *) stringFromMD5:(NSString*)str{
    
    if(self == nil || [str length] == 0)
        return nil;
    
    const char *value = [str UTF8String];
    
    unsigned char outputBuffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(value, (uint32_t)strlen(value), outputBuffer);
    
    NSMutableString *outputString = [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(NSInteger count = 0; count < CC_MD5_DIGEST_LENGTH; count++){
        [outputString appendFormat:@"%02x",outputBuffer[count]];
    }
    
    NSString *strRet = [NSString stringWithString:outputString];
    
    return strRet;
}


/**
 @brief  根据时间，随机数，MD5加密而成(建议换成hash)
 @return 设备ID
 */
+ (NSString*)getDeviceID
{  
    KeychainItemWrapper *wrapper = [[KeychainItemWrapper alloc] initWithIdentifier:@"LBXDeviceID" accessGroup:nil];
       
    NSString *strID = [wrapper objectForKey:(__bridge id)(kSecAttrAccount)];
    if ( strID == nil || [strID isEqualToString:@""] )
    {
        strID = [self createDeviceID];
        [wrapper setObject:strID forKey:(__bridge id)(kSecAttrAccount)];
    }
    wrapper = nil;
    
    
    
    return [[self class] stringFromMD5:strID];
}

+ (NSString*)getUUID
{
    KeychainItemWrapper *wrapper = [[KeychainItemWrapper alloc] initWithIdentifier:@"LBXDeviceID" accessGroup:nil];
    
    NSString *strID = [wrapper objectForKey:(__bridge id)(kSecAttrAccount)];
    if ( strID == nil || [strID isEqualToString:@""] )
    {
        strID = [self randomUUID];
        [wrapper setObject:strID forKey:(__bridge id)(kSecAttrAccount)];
    }
    wrapper = nil;
    
    return strID;

}

+ (NSString *)randomUUID {
    if(NSClassFromString(@"NSUUID")) { // only available in iOS >= 6.0
        return [[NSUUID UUID] UUIDString];
    }
    CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
    CFStringRef cfuuid = CFUUIDCreateString(kCFAllocatorDefault, uuidRef);
    CFRelease(uuidRef);
    NSString *uuid = [((__bridge NSString *) cfuuid) copy];
    CFRelease(cfuuid);
    return uuid;
}

+ (void)setValue:(NSString *)value forKey:(NSString *)key inService:(NSString *)service
{
    NSMutableDictionary *keychainItem = [[NSMutableDictionary alloc] init];
    keychainItem[(__bridge id)kSecClass] = (__bridge id)kSecClassGenericPassword;
    keychainItem[(__bridge id)kSecAttrAccessible] = (__bridge id)kSecAttrAccessibleAlways;
    keychainItem[(__bridge id)kSecAttrAccount] = key;
    keychainItem[(__bridge id)kSecAttrService] = service;
    keychainItem[(__bridge id)kSecValueData] = [value dataUsingEncoding:NSUTF8StringEncoding];
    SecItemAdd((__bridge CFDictionaryRef)keychainItem, NULL);
}


+ (NSString*)getDeviceName
{
    //根据这个链接里面的资料，可以转换
    //https://www.theiphonewiki.com/wiki/Models
    return [Hardware  platform];
}





@end
