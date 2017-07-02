//
//  WithASDKViewController.m
//  ASDKTestOn4S
//
//  Created by CambriaYang on 16/3/27.
//  Copyright © 2016年 CambriaYang. All rights reserved.
//

#import "WithASDKViewController.h"

#import "WithASDKTableViewCell.h"

@interface WithASDKViewController ()

@end

@implementation WithASDKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.baseTableView registerClass:[WithASDKTableViewCell class] forCellReuseIdentifier:@"WithASDKCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --- TableView Datasource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WithASDKCell" forIndexPath:indexPath];
    
    return cell;
}

@end
