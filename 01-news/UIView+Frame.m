//
//  UIView+Frame.m
//
//  Created by 1 on 16/1/4.
//  Copyright © 2016年 . All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

- (void)setLdl_width:(CGFloat)ldl_width{
    CGRect frame = self.frame;
    frame.size.width = ldl_width;
    self.frame = frame;
}

- (CGFloat)ldl_width
{
    return self.frame.size.width;
}

- (void)setLdl_height:(CGFloat)ldl_height
{
    CGRect frame = self.frame;
    frame.size.height = ldl_height;
    self.frame = frame;
}
- (CGFloat)ldl_height
{
     return self.frame.size.height;
}

- (void)setLdl_x:(CGFloat)ldl_x
{
    CGRect frame = self.frame;
    frame.origin.x = ldl_x;
    self.frame = frame;
}

- (CGFloat)ldl_x
{
    return self.frame.origin.x;
}

- (void)setLdl_y:(CGFloat)ldl_y
{
    CGRect frame = self.frame;
    frame.origin.y = ldl_y;
    self.frame = frame;
}

- (CGFloat)ldl_y
{
    return self.frame.origin.y;
}

-(void)setLdl_centerX:(CGFloat)ldl_centerX
{
    CGPoint center = self.center;
    center.x = ldl_centerX;
    self.center = center;

}
-(void)setLdl_centerY:(CGFloat)ldl_centerY
{
    CGPoint center = self.center;
    center.y = ldl_centerY;
    self.center = center;

}
-(CGFloat)ldl_centerX
{
    return self.center.x;

}
-(CGFloat)ldl_centerY
{
    return self.center.y;
}


@end
