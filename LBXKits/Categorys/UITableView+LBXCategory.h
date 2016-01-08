//
//  UITableView+Category.h
//
//
//  Created by lbxia on 15/4/20.
//  Copyright (c) 2015年 lbxia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UITableView(LBXCategory)


/*!
 @brief  隐藏多余的UITableViewCell
 */
- (void)hiddenExtraCellLine;


/*!
 @brief  ios7之后，设置列表分割线从左边开始绘制
 */
- (void)setSeparatorStartLeft;

@end
