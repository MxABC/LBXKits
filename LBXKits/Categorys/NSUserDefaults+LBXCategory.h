//
//  NSUserDefaults+Category.h
//
//
//  Created by xialibing on 15/4/20.
//  Copyright (c) 2015年 lbxia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults(LBXCategory)


/*!
 * @brief 存储用户首选项
 * @param strMsg 存储的内容
 * @param strKey 内容对应的key
 */
+ (void)save:(id)strMsg forKey:(NSString *)strKey;


/*!
 *  清空用户首选项内容
 *
 *  @param strKey key
 */
+ (void)remove:(NSString*)strKey;

/*!
 * @brief 读取用户首选项
 * @param strKey 读取的首选项key
 * @result 返回对应key的值
 */
+ (id)get:(NSString *)strKey;


/*!
 * @brief 存储用户首选项
 * @param status 存储的状态
 * @param strKey 内容对应的key
 */
+ (void)saveBOOL:(BOOL)status forKey:(NSString*)strKey;

/*!
 * @brief 读取用户首选项
 * @param strKey 读取的首选项key
 * @result 返回对应key的状态
 */
+ (BOOL)getBOOLWithKey:(NSString*)strKey;


@end
