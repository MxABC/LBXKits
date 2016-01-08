//
//  NSDate+Category.h
//
//
//  Created by lbxia on 15/4/20.
//  Copyright (c) 2015年 lbxia. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSDate(LBXCategory)


/**
 @brief  获取当前时间字符串
 @param format 格式,如 @"YYYY-MM-dd hh:mm:ss:sss"
 @return 返回指定格式的时间字符串
 */
- (NSString*)toNSStringWithFormat:(NSString*)format;




@end
