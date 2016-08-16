//
//  UIView+Frame.h
//  01-BuDeJie
//
//  Created by 1 on 16/1/4.
//  Copyright © 2016年 ldl. All rights reserved.
//

#import <UIKit/UIKit.h>

// @property只会生成get,set方法声明,不会生成实现和下划线成员属性
// 开发规范:自己的分类,尽量添加项目前缀
@interface UIView (Frame)

@property CGFloat ldl_width;
@property CGFloat ldl_height;
@property CGFloat ldl_x;
@property CGFloat ldl_y;
@property CGFloat ldl_centerX;
@property CGFloat ldl_centerY;




@end
