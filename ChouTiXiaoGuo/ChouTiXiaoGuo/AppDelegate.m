//
//  AppDelegate.m
//  ChouTiXiaoGuo
//
//  Created by WangShengFeng on 15/11/11.
//  Copyright © 2015年 WangShengFeng. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (UIWindow *)window
{
    if (!_window) {
        _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        [_window makeKeyAndVisible];
    }
    return _window;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    ViewController *viewVC = [[ViewController alloc] init];
    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:viewVC];
    UITabBarController *tabBarVC = [[UITabBarController alloc] init];
    [tabBarVC addChildViewController:navVC];

    self.window.rootViewController = tabBarVC;

    return YES;
}

@end
