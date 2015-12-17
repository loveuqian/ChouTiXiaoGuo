//
//  SlideViewController.m
//  ChouTiXiaoGuo
//
//  Created by WangShengFeng on 15/11/19.
//  Copyright © 2015年 WangShengFeng. All rights reserved.
//

#import "SlideViewController.h"

@implementation SlideViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor orangeColor];
}

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
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSLog(@"%@", indexPath);
}

@end
