//
//  NSData+Category.m
//  
//
//  Created by lbxia on 15/4/20.
//  Copyright (c) 2015年 lbxia. All rights reserved.
//

#import "NSData+LBXCategory.h"

@implementation NSData(LBXCategory)


- (NSString*)toNSString
{
   return  [[NSString alloc] initWithData:self  encoding:NSUTF8StringEncoding];
}

/**
 * 数组转换成十六进制字符串
 *
 * @param byte[]
 * @return HexString
 */
- (NSString*)toHexString
{
    NSMutableString *arrayString = [[NSMutableString alloc]init];
    int len = (int)self.length;
    char bytes[2048]={0};
    memcpy(bytes, self.bytes, len);
    
    for (int i = 0; i < len; i++)
    {
        char cValue = bytes[i];
        
        int iValue = cValue;
        
        iValue = iValue & 0x000000FF;
        
        NSString *str = [NSString stringWithFormat:@"%02x",iValue];
        
        // NSLog(@"%@",str);
        
        // str = str.uppercaseString;
        
        [arrayString appendString:str.uppercaseString];
    }
    NSLog(@"toHexString:%@",arrayString);
    
    return arrayString;
}

- (NSDictionary*)toJson
{
   
    NSDictionary *jsonObject=[NSJSONSerialization
                              JSONObjectWithData:self
                              options:NSJSONReadingMutableLeaves
                              error:nil];
    
    return jsonObject;
    
}


@end
