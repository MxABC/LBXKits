//
//  RegularWrapper.m
//
//
//  Created by lbxia on 15/7/13.
//  Copyright (c) 2015年 lbxia. All rights reserved.
//

#import "RegularWrapper.h"

@implementation RegularWrapper


//手机号码验证
+ (BOOL) validateMobile:(NSString *)mobile
{
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((14[0-9])|(13[0-9])|(15[^4,\\D])|(18[0-9])|(17[0-9]))\\d{8}$";
   return [[self class] isRegularCheckPass:phoneRegex checkString:mobile];
}

+ (BOOL) validateChinese:(NSString*)strChinse
{
    NSString *match=@"(^[\u4e00-\u9fa5]+$)";
   return [[self class] isRegularCheckPass:match checkString:strChinse];
}


//邮箱
+ (BOOL) validateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}


//车牌号验证
+ (BOOL) validateCarNo:(NSString *)carNo
{
    NSString *carRegex = @"^[\u4e00-\u9fa5]{1}[a-zA-Z]{1}[a-zA-Z_0-9]{4}[a-zA-Z_0-9_\u4e00-\u9fa5]$";
   return [[self class] isRegularCheckPass:carRegex checkString:carNo];
}


//车型
+ (BOOL) validateCarType:(NSString *)CarType
{
    NSString *CarTypeRegex = @"^[\u4E00-\u9FFF]+$";
    return [[self class] isRegularCheckPass:CarTypeRegex checkString:CarType];
}


//用户名
+ (BOOL) validateUserName:(NSString *)name
{
    NSString *userNameRegex = @"^[A-Za-z0-9]{6,20}+$";
   return [[self class] isRegularCheckPass:userNameRegex checkString:name];
}


//密码
+ (BOOL) validatePassword:(NSString *)passWord
{
    NSString *passWordRegex = @"^[a-zA-Z0-9]{6,20}+$";
    return [[self class] isRegularCheckPass:passWordRegex checkString:passWord];
}


//昵称
+ (BOOL) validateNickname:(NSString *)nickname
{
    NSString *nicknameRegex = @"^[\u4e00-\u9fa5]{4,8}$";
    return [[self class] isRegularCheckPass:nicknameRegex checkString:nickname];
}


//身份证号
+ (BOOL) validateIdentityCard: (NSString *)identityCard
{
    BOOL flag;
    if (identityCard.length <= 0) {
        flag = NO;
        return flag;
    }else if (identityCard.length == 15){
        flag = YES;
        return flag;
    }else{
        //    NSString *regex2 = @"^(\\d{14}|\\d{17}|\\d{18})(\\d|[xX])$";
        //^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}([\\d|x|X]{1})$
        NSString *regex2 = @"^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}([\\d|x|X]{1})$";
      
        return [[self class] isRegularCheckPass:regex2 checkString:identityCard];
    }
}

+ (BOOL)isRegularCheckPass:(NSString*)regex checkString:(NSString*)checkString
{
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [identityCardPredicate evaluateWithObject:checkString];
}


@end
