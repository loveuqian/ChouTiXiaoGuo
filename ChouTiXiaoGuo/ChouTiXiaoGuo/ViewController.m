//
//  ViewController.m
//  ChouTiXiaoGuo
//
//  Created by WangShengFeng on 15/11/11.
//  Copyright © 2015年 WangShengFeng. All rights reserved.
//

#import "ViewController.h"
#import "UIView+WSFExtension.h"

@interface ViewController ()

@property (nonatomic, weak) UIView *cebian;

@property (nonatomic, strong) UIWindow *myW;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    UIView *cebian = [[UIView alloc] init];
    self.cebian = cebian;
    self.cebian.frame = CGRectMake(-150, 0, 150, [UIScreen mainScreen].bounds.size.height);
    self.cebian.backgroundColor = [UIColor redColor];
    [[UIApplication sharedApplication].keyWindow addSubview:self.cebian];

    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.view addGestureRecognizer:pan];

    UISwitch *sw = [[UISwitch alloc] init];
    [self.cebian addSubview:sw];
    sw.y = 150;
}

- (void)pan:(UIPanGestureRecognizer *)pan
{
    CGPoint transP = [pan translationInView:self.view];
    CGFloat offsetX = transP.x;
    self.navigationController.view.frame = [self frameWithOffsetX:offsetX];
    self.cebian.frame = [self frameWithOffsetX2:offsetX];
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
    CGRect frame = self.cebian.frame;
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
                         if (self.cebian.x == 0) {
                             self.cebian.x = -150;
                             self.navigationController.view.x = 0;
                         }
                         else {
                             self.cebian.x = 0;
                             self.navigationController.view.x = 150;
                         }
                     }];
}

@end
