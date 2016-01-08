//
//  UIImage+Category.m
//
//
//  Created by lbxia on 15/4/20.
//  Copyright (c) 2015年 lbxia. All rights reserved.
//

#import "UIImage+LBXCategory.h"

@implementation UIImage(LBXCategory)



- (UIImage *)scaleToSize:(CGSize)size
{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    // 绘制改变大小的图片
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return scaledImage;
}


- (NSData*)pngImage2NSData
{
   return  UIImagePNGRepresentation(self);
}

- (NSData*)jpgImage2NSDataWithCompressionQuality:(CGFloat)compressionQuality
{
    return UIImageJPEGRepresentation(self, compressionQuality);
}


/*!
 @brief  存储图像以JPG格式到filePath路径
 @param filePath 存储路径
 */
- (BOOL)storeToJpgFileWithPath:(NSString*)filePath
{
    NSData *dataObj = UIImageJPEGRepresentation(self, 1.0);
    
    return [dataObj writeToFile:filePath atomically:YES];
}

@end
