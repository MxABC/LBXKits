//
//  NSData+Category.h
//
//
//  Created by lbxia on 15/4/20.
//  Copyright (c) 2015年 lbxia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData(LBXCategory)


/**
 @brief  转换成NSString，以NSUTF8StringEncoding编码
 @return NSString
 */
- (NSString*)toNSString;

/**
 * 数组转换成十六进制大写字符串
 *
 * @param byte[]
 * @return HexString
 */

- (NSString*)toHexString;

/**
 @brief  转换成JSON
 @return 字典
 */
- (NSDictionary*)toJson;



@end
