//
//  UITableView+Category.m
//  
//
//  Created by lbxia on 15/4/20.
//  Copyright (c) 2015年 lbxia. All rights reserved.
//

#import "UITableView+LBXCategory.h"

@implementation UITableView(LBXCategory)

- (void)hiddenExtraCellLine
{
    UIView *view =[[UIView alloc]init];
    view.backgroundColor = [UIColor clearColor];
    [self setTableFooterView:view];
    [self setTableHeaderView:view];
    
}

/*!
 @brief  ios7之后，设置列表分割线从左边开始绘制
 */
- (void)setSeparatorStartLeft
{ 
    if([self respondsToSelector:@selector(setSeparatorInset:)])
    {
         [self setSeparatorInset:UIEdgeInsetsZero];
    }
}

@end
