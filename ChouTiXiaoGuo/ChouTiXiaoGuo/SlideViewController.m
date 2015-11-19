//
//  SlideViewController.m
//  ChouTiXiaoGuo
//
//  Created by WangShengFeng on 15/11/19.
//  Copyright © 2015年 WangShengFeng. All rights reserved.
//

#import "SlideViewController.h"

@implementation SlideViewController

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];

    cell.textLabel.text = [NSString stringWithFormat:@"%zd", indexPath.row];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%@", indexPath);
}

@end
