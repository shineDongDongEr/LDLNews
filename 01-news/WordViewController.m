

//
//  WordViewController.m
//  01-news
//
//  Created by laidongling on 16/8/5.
//  Copyright © 2016年 Jin Liu. All rights reserved.
//

#import "WordViewController.h"

@implementation WordViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1];
}

@end
