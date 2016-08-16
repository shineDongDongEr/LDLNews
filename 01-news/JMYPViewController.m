
//
//  JMYPViewController.m
//  01-news
//
//  Created by Jin Liu on 16/8/4.
//  Copyright © 2016年 Jin Liu. All rights reserved.
//

#import "JMYPViewController.h"
#import "HotViewController.h"
#import "HeadNewViewController.h"
#import "TVPlayerViewController.h"
#import "SocieatyViewController.h"
#import "MusicViewcontroller.h"
#import "WordViewController.h"

@interface JMYPViewController ()

@end

@implementation JMYPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"聚美优品";
    HotViewController *hotVC = [[HotViewController alloc]init];
    hotVC.title = @"热点";
    [self addChildViewController:hotVC];
    HeadNewViewController *headVC = [[HeadNewViewController alloc]init];
    headVC.title = @"头条";
    [self addChildViewController:headVC];
    TVPlayerViewController *tvPlayVC = [[TVPlayerViewController alloc]init];
    tvPlayVC.title = @"视频";
    [self addChildViewController:tvPlayVC];
    SocieatyViewController *socieatVC = [[SocieatyViewController alloc]init];
    socieatVC.title = @"社会";
    [self addChildViewController:socieatVC];
    MusicViewcontroller *musicVC = [[MusicViewcontroller alloc]init];
    musicVC.title = @"音乐协会";
    [self addChildViewController:musicVC];
    WordViewController *wordVC = [[WordViewController alloc]init];
    wordVC.title = @"段子";
    [self addChildViewController:wordVC];
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
