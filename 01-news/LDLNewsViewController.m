
//
//  NewsViewController.m
//  01-news
//
//  Created by Jin Liu on 16/8/4.
//  Copyright © 2016年 LaiDongling . All rights reserved.
//

#import "LDLNewsViewController.h"
#import "HotViewController.h"
#import "TVPlayerViewController.h"
#import "HeadNewViewController.h"
#import "SocieatyViewController.h"
#import "LDLButton.h"
#import "UIView+Frame.h"

static CGFloat const navBarH = 64;
static CGFloat const titleScrollViewH = 44;
static CGFloat const btnW = 100;
static CGFloat const LDLScale = 1.3;
#define LDLScreenW [UIScreen mainScreen].bounds.size.width
#define LDLScreenH [UIScreen mainScreen].bounds.size.height
#define LDLRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1]

@interface LDLNewsViewController ()<UIScrollViewDelegate>

@property(nonatomic,weak)UIScrollView *titleView;
@property(nonatomic,weak)UIScrollView *contentView;
@property(nonatomic,strong) UIView *underline;

@property(nonatomic,assign)BOOL isInitial;

@property(nonatomic,strong)NSMutableArray<UIButton *> *titleBtns;
@property(nonatomic,weak)LDLButton *selectBtn;



@end

@implementation LDLNewsViewController

#pragma mark  - 控制器生命周期-----

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self addTitleView];
    [self addContentView];
    
 }

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    //添加所有标题;
    if (!_isInitial) {
    [self setUpAllTitleButton];
        //添加下划线;
    [self addUnderLineView];
        
    }
    _isInitial = YES;

}
#pragma mark  - lazyLoading-----
- (NSMutableArray<UIButton *> *)titleBtns
{
    if (!_titleBtns) {
        _titleBtns = [NSMutableArray array];
    }
    return _titleBtns;

}

- (void)addTitleView
{
    CGFloat titleViewX = 0;
    CGFloat titleViewY = self.navigationController ? navBarH : 0 ;
    UIScrollView *titleView = [[UIScrollView alloc]init];
    titleView.frame = CGRectMake(titleViewX, titleViewY, LDLScreenW, titleScrollViewH);
    titleView.backgroundColor = LDLRandomColor;
    [self.view addSubview:titleView];
    titleView.delegate = self;
    _titleView = titleView;
    titleView.tag = 101;

    
}
//添加下划线;
- (void)addUnderLineView
{

    // 第一个按钮
    LDLButton *firstTitleButton = self.titleView.subviews.firstObject;
    
    // 下划线
    UIView *underline = [[UIView alloc] init];
    underline.backgroundColor = [firstTitleButton titleColorForState:UIControlStateSelected];
    underline.ldl_height = 2;
    underline.backgroundColor = [UIColor redColor];
    underline.ldl_y = self.titleView.ldl_height - underline.ldl_height;
    [self.titleView addSubview:underline];
    self.underline = underline;
    
    // 默认选中第一个按钮
    // 改变按钮状态
    firstTitleButton.selected = YES; // UIControlStateSelected
    self.selectBtn = firstTitleButton;
    
    [firstTitleButton.titleLabel sizeToFit]; // 主动根据文字内容计算按钮内部label的大小
    // 下划线宽度 == 按钮内部文字的宽度
    underline.ldl_width = firstTitleButton.titleLabel.ldl_width + 10;
    // 下划线中心点x
    underline.ldl_centerX = firstTitleButton.ldl_centerX;

    
    
    

}
- (void)addContentView
{
    CGFloat contentViewX = 0;
    CGFloat contentViewY = 108;
    CGFloat contentViewH = LDLScreenH - contentViewY;
    UIScrollView *contentView = [[UIScrollView alloc]init];
    contentView.frame = CGRectMake(contentViewX, contentViewY, LDLScreenW, contentViewH);
    contentView.backgroundColor = LDLRandomColor;
    _contentView = contentView;
    contentView.delegate = self;
    [self.view addSubview:contentView];
    contentView.tag = 102;
}
- (void)setUpAllTitleButton
{
    
    //1.获取子控件总数;
    NSInteger count = self.childViewControllers.count;
    //2.遍历子控件设置标题按钮;
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    CGFloat btnH = titleScrollViewH;
    for (int i = 0 ; i < count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btnX = i *btnW;
        btn.tag = i;
        btn.frame =CGRectMake(btnX, btnY, btnW, btnH);
      
        
        UIViewController *VC = self.childViewControllers[i];
        [btn setTitle:VC.title forState:UIControlStateNormal];
        
       
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
     
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];

        [self.titleView addSubview:btn];
        /**
         *  默认选择第0个btn;
         */
        if (i == 0) {
            [self btnClick:btn];
        }
        //4.存入按钮数组;
        NSLog(@"&&&&&&&&&&&&********%@*********",self.titleBtns);
        [self.titleBtns addObject:btn];

    }
    CGFloat contentW = count * btnW;
    self.titleView.contentSize = CGSizeMake(contentW, 0);
    self.titleView.showsHorizontalScrollIndicator = NO;
//      //6.设置内容滚动范围;
    self.contentView.contentSize = CGSizeMake(LDLScreenW * count, 0);
    self.contentView.showsHorizontalScrollIndicator = NO;
    self.contentView.pagingEnabled = YES;
    self.contentView.bounces = NO;
    
}

//点击了某个button;
- (void)btnClick:(UIButton *)btn
{

    NSInteger index = btn.tag;
    [self btnTitleSelect:btn];
    [self setUpChildController:btn.tag];
    [self.contentView setContentOffset:CGPointMake(index * LDLScreenW, 0) animated:YES];
    
    
    
    
    

}
- (void)setUpChildController:(NSInteger)i
{
    UIViewController *vc = self.childViewControllers[i];
    if (vc.view.superview) return;
    CGFloat X = i * LDLScreenW;
    CGFloat Y = 0;
    CGFloat W = self.contentView.frame.size.width;
    CGFloat H = self.contentView.frame.size.height;

    vc.view.frame = CGRectMake(X, Y, W, H);
    [self.contentView addSubview:vc.view];

}

- (void)btnTitleSelect:(UIButton *)btn
{
    [_selectBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _selectBtn.transform = CGAffineTransformIdentity;
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    btn.transform = CGAffineTransformMakeScale(LDLScale, LDLScale);
    _selectBtn = btn;
    // 设置标题缩放
    //文字居中;
    [self setUpCenter:btn];
    //移动下划线;
    [UIView animateWithDuration:0.15 animations:^{
        
        self.underline.ldl_width = btn.titleLabel.ldl_width + 10;
        self.underline.ldl_centerX = btn.ldl_centerX;
    }];
    

}

- (void)setUpCenter:(UIButton *)btn
{
    CGFloat offsetX = btn.center.x - LDLScreenW * 0.5;
    if (offsetX < 0) {
        offsetX = 0;
    }
    CGFloat maxOffsetX = self.titleView.contentSize.width - LDLScreenW;
    if (offsetX > maxOffsetX) {
        offsetX = maxOffsetX;
    }
    [self.titleView setContentOffset:CGPointMake(offsetX, 0) animated:YES];

}
#pragma mark ----UIScrollViewDelegate


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.tag == 101) {
        
        return;
    }
    NSInteger count = self.titleBtns.count;
    NSInteger leftI = scrollView.contentOffset.x / LDLScreenW;
    NSInteger rightI = leftI + 1;
    NSLog(@"------****%@***-------",self.titleBtns);
    UIButton *leftBtn = self.titleBtns[leftI];
    
    UIButton *rightBtn;
    if (rightI < count) {
        rightBtn = self.titleBtns[rightI];
    }
    CGFloat Rscale = scrollView.contentOffset.x/LDLScreenW -leftI;
    CGFloat Lscale = 1 - Rscale;
    CGFloat transformScale = LDLScale - 1;

    leftBtn.transform = CGAffineTransformMakeScale(Lscale * transformScale + 1, Lscale * transformScale + 1);
    rightBtn.transform = CGAffineTransformMakeScale(Rscale * transformScale + 1, Rscale * transformScale + 1);
    
    // 4.标题颜色渐变
    // 4.1获取右边按钮颜色
    UIColor *rightColor = [UIColor colorWithRed:Rscale green:0 blue:0 alpha:1];
    UIColor *leftColor = [UIColor colorWithRed:Lscale green:0 blue:0 alpha:1];
    [leftBtn setTitleColor:leftColor forState:UIControlStateNormal];
    [rightBtn setTitleColor:rightColor forState:UIControlStateNormal];

}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    NSInteger i = scrollView.contentOffset.x / LDLScreenW;
    [self btnTitleSelect:self.titleBtns[i]];
    [self setUpChildController:i];

}


@end
