//
//  ChouTiXiaoGuoViewController.m
//  ChouTiXiaoGuo
//
//  Created by WangShengFeng on 15/12/16.
//  Copyright © 2015年 WangShengFeng. All rights reserved.
//

#import "ChouTiXiaoGuoViewController.h"
#import "SlideViewController.h"
#import "UIView+WSFExtension.h"

@interface ChouTiXiaoGuoViewController ()

@property (nonatomic, strong) SlideViewController *slideVC;
@property (nonatomic, weak) UIView *slide;

@end

@implementation ChouTiXiaoGuoViewController

// 抽屉 view 宽度
#define choutiWidth 150

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self setupNavBtn];

    [self setupPan];

    [self setupSlide];
}

- (void)setupNavBtn
{
    UIButton *settingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [settingBtn setImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
    [settingBtn sizeToFit];
    [settingBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:settingBtn];
}

- (void)btnClick
{
    [UIView animateWithDuration:0.25
                     animations:^{
                         if (self.slide.x == 0) {
                             self.slide.x = -choutiWidth;
                             self.tabBarController.view.x = 0;
                         }
                         else {
                             self.slide.x = 0;
                             self.tabBarController.view.x = choutiWidth;
                         }
                     }];
}

- (void)setupPan
{
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.view addGestureRecognizer:pan];
}

- (void)pan:(UIPanGestureRecognizer *)pan
{
    CGPoint transP = [pan translationInView:self.view];
    CGFloat offsetX = transP.x;
    self.tabBarController.view.frame = [self frameWithOffsetX:offsetX];
    self.slide.frame = [self frameWithOffsetX2:offsetX];
    [pan setTranslation:CGPointZero inView:self.view];
}

- (CGRect)frameWithOffsetX:(CGFloat)offsetX
{
    CGRect frame = self.tabBarController.view.frame;
    CGFloat x = frame.origin.x + offsetX;
    frame.origin.x = x;
    if (frame.origin.x > choutiWidth) {
        frame.origin.x = choutiWidth;
    }
    if (frame.origin.x < 0) {
        frame.origin.x = 0;
    }
    return frame;
}

- (CGRect)frameWithOffsetX2:(CGFloat)offsetX
{
    CGRect frame = self.slide.frame;
    CGFloat x = frame.origin.x + offsetX;
    frame.origin.x = x;
    if (frame.origin.x > 0) {
        frame.origin.x = 0;
    }
    if (frame.origin.x < -choutiWidth) {
        frame.origin.x = -choutiWidth;
    }
    return frame;
}

- (void)setupSlide
{
    SlideViewController *slide = [[SlideViewController alloc] init];
    self.slideVC = slide;

    slide.view.frame = CGRectMake(-choutiWidth, 0, choutiWidth, [UIScreen mainScreen].bounds.size.height);
    self.slide = slide.view;
    [[UIApplication sharedApplication].keyWindow addSubview:slide.view];
}

@end
