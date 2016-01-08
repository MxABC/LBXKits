//
//  UIImage+Category.h
//
//
//  Created by lbxia on 15/4/20.
//  Copyright (c) 2015年 lbxia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIImage(LBXCategory)

/*!
 @brief  缩放到指定大小
 @param size 新图像大小
 @return 缩放后的图像
 */
- (UIImage *)scaleToSize:(CGSize)size;


/**
 @brief  UIImage,png格式图像，转换成NSData
 @return NSData
 */
- (NSData*)pngImage2NSData;


/**
 @brief  UIImage,jpg格式图像，转换NSData
 @param compressionQuality 压缩率 （0-1），值越大，图像数据越大（图像越清晰）
 @return <#return value description#>
 */
- (NSData*)jpgImage2NSDataWithCompressionQuality:(CGFloat)compressionQuality;


/*!
 @brief  存储图像以JPG格式到filePath路径
 @param filePath 存储路径
 */


- (BOOL)storeToJpgFileWithPath:(NSString*)filePath;


//类似anrdoid .9图片功能




@end
