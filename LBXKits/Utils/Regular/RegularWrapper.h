//
//  RegularWrapper.h
//
//
//  Created by lbxia on 15/7/13.
//  Copyright (c) 2015年 lbxia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegularWrapper : NSObject

/**
 @brief  正常表达式检测
 @param regex       正则表达式
 @param checkString 待检查数据
 @return 通过：YES，不通过：NO
 */
+ (BOOL)isRegularCheckPass:(NSString*)regex checkString:(NSString*)checkString;



/**
 @brief  手机号码验证
 @param mobile 手机号
 @return 通过：YES，不通过：NO
 */
+ (BOOL) validateMobile:(NSString *)mobile;

/**
 @brief  中文字符验证
 @param strChinse 中文字符
 @return 通过：YES，不通过：NO
 */
+ (BOOL) validateChinese:(NSString*)strChinse;


/**
 @brief  邮箱格式验证
 @param email 邮箱
 @return 通过：YES，不通过：NO
 */
+ (BOOL) validateEmail:(NSString *)email;

/**
 @brief  车牌号验证
 @param carNo 车牌号
 @return 通过：YES，不通过：NO
 */
+ (BOOL) validateCarNo:(NSString *)carNo;



/**
 @brief  用户名验证
 @param name 用户名
 @return 通过：YES，不通过：NO
 */
+ (BOOL) validateUserName:(NSString *)name;



/**
 @brief  密码验证
 @param passWord 密码
 @return 通过：YES，不通过：NO
 */
+ (BOOL) validatePassword:(NSString *)passWord;




/**
 @brief  身份证验证
 @param identityCard 身份证号码
 @return 通过：YES，不通过：NO
 */
+ (BOOL) validateIdentityCard: (NSString *)identityCard;



@end
