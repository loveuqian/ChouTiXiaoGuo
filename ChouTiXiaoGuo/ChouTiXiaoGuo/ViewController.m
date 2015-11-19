//
//  ViewController.m
//  ChouTiXiaoGuo
//
//  Created by WangShengFeng on 15/11/11.
//  Copyright © 2015年 WangShengFeng. All rights reserved.
//

#import "ViewController.h"
#import "SlideViewController.h"
#import "UIView+WSFExtension.h"

@interface ViewController ()

@property (nonatomic, strong) SlideViewController *slideVC;
@property (nonatomic, weak) UIView *slide;

@property (nonatomic, strong) UIWindow *myW;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.view addGestureRecognizer:pan];

    SlideViewController *slide = [[SlideViewController alloc] init];
    //    [self addChildViewController:slide];
    self.slideVC = slide;

    slide.view.frame = CGRectMake(-150, 0, 150, [UIScreen mainScreen].bounds.size.height);
    slide.view.backgroundColor = [UIColor redColor];
    self.slide = slide.view;
    [[UIApplication sharedApplication].keyWindow addSubview:slide.view];
}

- (void)pan:(UIPanGestureRecognizer *)pan
{
    CGPoint transP = [pan translationInView:self.view];
    CGFloat offsetX = transP.x;
    self.navigationController.view.frame = [self frameWithOffsetX:offsetX];
    self.slide.frame = [self frameWithOffsetX2:offsetX];
    [pan setTranslation:CGPointZero inView:self.view];
}

- (CGRect)frameWithOffsetX:(CGFloat)offsetX
{
    CGRect frame = self.navigationController.view.frame;
    CGFloat x = frame.origin.x + offsetX;
    frame.origin.x = x;
    if (frame.origin.x > 150) {
        frame.origin.x = 150;
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
    if (frame.origin.x < -150) {
        frame.origin.x = -150;
    }
    return frame;
}

- (IBAction)btnClick:(id)sender
{
    [UIView animateWithDuration:0.25
                     animations:^{
                         if (self.slide.x == 0) {
                             self.slide.x = -150;
                             self.navigationController.view.x = 0;
                         }
                         else {
                             self.slide.x = 0;
                             self.navigationController.view.x = 150;
                         }
                     }];
}

@end
