//
//  NSString+Category.h
//
//
// 
//  Copyright (c) 2014年  All rights reserved.
//

#import <Foundation/Foundation.h>


#define TT_FIX_CATEGORY_BUG(name) @interface TT_FIX_CATEGORY_BUG_##name:NSObject @end \
@implementation TT_FIX_CATEGORY_BUG_##name @end



@interface NSString (LBXCategory)


- (CGSize)stringgetSizebyMaxWidth:(CGFloat)sizwW Font:(UIFont *)font;
- (CGSize)stringgetSizebySize:(CGSize)size Font:(UIFont *)font;
+ (NSString *)removeZero:(float)num;




#pragma mark - 加密
/**
 @brief  GTMBase64加密,字符串UTF-8编码(系统自带base64测试，一样数据，多次结果可能不一致)
 @return 加密后的字符串
 */
- (NSString*)toBase64Encode;

/**
 @brief  GTMBase64解密,字符串UTF-8编码
 @return 解密后的字符串
 */
- (NSString*)toBase64Decode;

/**
 @brief  MD5加密，02x形式
 @return MD5加密后的字符串
 */
- (NSString*)toMD5Encode;




#pragma mark -转换
/**
 @brief 转换NSData,以NSUTF8StringEncoding编码形式转换
 @return NSData
 */
- (NSData*)toNSData;


/**
 @brief  时间字符串转NSDate
 @param dateFormat 时间格式，如 @"yyyy-MM-dd HH:mm:ss"
 @return 返回NSDate
 */
- (NSDate*)toNSDateWithDateFormat:(NSString*)dateFormat;


/**
 @brief  16进制字符串转换UICOLOR
 @return UIColor
 */
- (UIColor *)hexStringtoColor;


@end
