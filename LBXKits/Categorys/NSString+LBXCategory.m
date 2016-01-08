//
//
//
//
//  Created by lbxia
//  Copyright (c) 2014年. All rights reserved.
//

#import "NSString+LBXCategory.h"
#import "GTMBase64.h"
#import <CommonCrypto/CommonDigest.h>


//TT_FIX_CATEGORY_BUG(11)

@implementation NSString (LBXCategory)
- (CGSize)stringgetSizebyMaxWidth:(CGFloat)sizwW Font:(UIFont *)font
{
//    NSDictionary *dict = @{NSFontAttributeName:font};
//    CGSize boundsize = CGSizeMake(sizwW, MAXFLOAT);
//    if (IOSVersion7) {
//     
//    boundsize =[self boundingRectWithSize:boundsize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
//        
//    }else  boundsize = [self sizeWithFont:font constrainedToSize: boundsize lineBreakMode:NSLineBreakByWordWrapping];
//    return boundsize;
    
    CGSize boundsize = CGSizeMake(sizwW, MAXFLOAT);
    return [self stringgetSizebySize:boundsize Font:font];
}

- (CGSize)stringgetSizebySize:(CGSize)size Font:(UIFont *)font
{
    NSDictionary *dict = @{NSFontAttributeName:font};
    CGSize boundsize = size;
    if ([[[UIDevice currentDevice]systemVersion]floatValue] >= 7.0) {
        
        boundsize =[self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
        
    }else  boundsize = [self sizeWithFont:font constrainedToSize: size lineBreakMode:NSLineBreakByWordWrapping];
    return boundsize;
}


+ (NSString *)removeZero:(float)num
{
    NSString *string = [NSString stringWithFormat:@"%.1f万",num];
    string = [string stringByReplacingOccurrencesOfString:@".0" withString:@""];
    return string;
}


//base64加密
- (NSString*)toBase64Encode
{    
    NSData* originData = [self dataUsingEncoding:NSUTF8StringEncoding];
    
    NSData* encodeData = [GTMBase64 encodeData:originData];
    
    return  [[NSString alloc] initWithData:encodeData encoding:NSUTF8StringEncoding];
}

- (NSString*)toBase64Decode
{
   // NSData* dataFromString = [[NSData alloc] initWithBase64EncodedString:self options:0];
   // return [NSString stringWithUTF8String:[dataFromString bytes]]; // prints "String is Some sample data"
    
    
    NSData* encodeData = [self dataUsingEncoding:NSUTF8StringEncoding];
    
    NSData* decodeData = [GTMBase64 decodeData:encodeData];
    
    return [[NSString alloc] initWithData:decodeData encoding:NSUTF8StringEncoding];
}


- (NSString*)toMD5Encode
{
    if (self == nil) {
        return @"";
    }
    
    const char *cStr = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), result );
    
    //02X:大写  02x：小写
    //    return [NSString stringWithFormat:
    //            @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
    //            result[0], result[1], result[2], result[3], result[4], result[5], result[6], result[7],
    //            result[8], result[9], result[10], result[11], result[12], result[13], result[14], result[15]
    //            ];
    
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];
    for(int i = 0; i<CC_MD5_DIGEST_LENGTH; i++)
        [ret appendFormat:@"%02x",result[i]];
    
    return ret;

}


- (NSDate*)toNSDateWithDateFormat:(NSString*)dateFormat
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:dateFormat];
    
    return  [dateFormatter dateFromString:self];
}


+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha
{
    //删除字符串中的空格
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6)
    {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"])
    {
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"])
    {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6)
    {
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha];
}

//默认alpha值为1
- (UIColor *)hexStringtoColor
{
    return [[self class] colorWithHexString:self alpha:1.0f];
}


- (NSData*)toNSData
{
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}




@end
