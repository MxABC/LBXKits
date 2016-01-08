//
//  UIView+Category.m
//
//
//  Created by lbxia on 15/4/20.
//  Copyright (c) 2015年 lbxia. All rights reserved.
//

#import "UIView+LBXCategory.h"

@implementation UIView(LBXCategory)


- (void)setCorner
{
    self.layer.masksToBounds = YES;
    
    [[self layer] setBorderWidth:2.0];//画线的宽度
    [[self layer] setBorderColor:[UIColor blueColor].CGColor];//颜色
    [[self layer] setCornerRadius:15.0];//圆角
}

- (void)setRoundedCorners:(UIRectCorner)corners radius:(CGSize)size
{
    UIBezierPath* maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:size];
    CAShapeLayer* maskLayer = [CAShapeLayer new];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}



- (void)setShadow
{
    self.layer.shadowOffset = CGSizeMake(0, 2);
    self.layer.shadowOpacity = 0.80;
}

- (UIViewController*)getControllerHasMe
{
    for (UIView* next = [self superview]; next; next = next.superview)
    {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]])
        {
            UIViewController *controller = (UIViewController*)nextResponder;
            
            return controller;
        }
    }
    return nil;
}


#pragma mark - UIView  封装了对其子视图层次管理，提供了将控件移到最前面或者最后面，也可以随意调整一个控件的z轴方向的位置。

-(NSUInteger)getSubviewIndex
{
    return [self.superview.subviews indexOfObject:self];
}

-(void)bringToFront
{
    [self.superview bringSubviewToFront:self];
}

-(void)sendToBack
{
    [self.superview sendSubviewToBack:self];
}

-(void)bringOneLevelUp
{
    int currentIndex = (int)[self getSubviewIndex];
    [self.superview exchangeSubviewAtIndex:currentIndex withSubviewAtIndex:currentIndex+1];
}

-(void)sendOneLevelDown
{
    int currentIndex = (int)[self getSubviewIndex];
    [self.superview exchangeSubviewAtIndex:currentIndex withSubviewAtIndex:currentIndex-1];
}

-(BOOL)isInFront
{
    return ([self.superview.subviews lastObject]==self);
}

-(BOOL)isAtBack
{
    return ([self.superview.subviews objectAtIndex:0]==self);
}

-(void)swapDepthsWithView:(UIView*)swapView
{
    [self.superview exchangeSubviewAtIndex:[self getSubviewIndex] withSubviewAtIndex:[swapView getSubviewIndex]];
}

#pragma mark - 截屏
-(UIImage*)imageByRenderingView
{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0.0f);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


@end
