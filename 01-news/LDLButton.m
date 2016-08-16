

//
//  LDLButton.m
//  01-news
//
//  Created by laidongling on 16/8/10.
//  Copyright © 2016年 Jin Liu. All rights reserved.
//

#import "LDLButton.h"

@implementation LDLButton

-(void)setHighlighted:(BOOL)highlighted
{
    //去高亮下的所有样式;
}
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame: frame]) {
        self.titleLabel.font = [UIFont boldSystemFontOfSize:14];
        [self setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    }
    return self;

}

@end
