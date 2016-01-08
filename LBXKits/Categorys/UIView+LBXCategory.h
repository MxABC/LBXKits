//
//  UIView+Category.h
//
//
//  Created by lbxia on 15/4/20.
//  Copyright (c) 2015年 lbxia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIView(LBXCategory)


/*!
 @brief  圆角
 */
- (void)setCorner;


- (void)setRoundedCorners:(UIRectCorner)corners radius:(CGSize)size; 

/*!
 @brief  阴影
 */
- (void)setShadow;

//获取属于的控制器
- (UIViewController*)getControllerHasMe;


#pragma mark - UIView  封装了对其子视图层次管理，提供了将控件移到最前面或者最后面，也可以随意调整一个控件的z轴方向的位置。

-(NSUInteger)getSubviewIndex;

-(void)bringToFront;
-(void)sendToBack;

-(void)bringOneLevelUp;
-(void)sendOneLevelDown;

-(BOOL)isInFront;
-(BOOL)isAtBack;

-(void)swapDepthsWithView:(UIView*)swapView;



#pragma mark - 截屏
-(UIImage*)imageByRenderingView;


@end
