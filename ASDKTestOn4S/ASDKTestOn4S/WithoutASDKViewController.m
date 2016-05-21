//
//  WithoutASDKViewController.m
//  ASDKTestOn4S
//
//  Created by CambriaYang on 16/3/27.
//  Copyright © 2016年 CambriaYang. All rights reserved.
//

#import "WithoutASDKViewController.h"

#import "NSMutableArray+SafeAdd.h"

@interface WithoutASDKViewController ()

@end

@implementation WithoutASDKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.baseTableView registerNib:[UINib nibWithNibName:@"WithoutASDKTableViewCell" bundle:nil] forCellReuseIdentifier:@"WithoutASDKCell"];
    
    NSMutableArray *array = [NSMutableArray array];
    
    [array addObject:@"1"];
    
    [array addObject:@"2"];
    
    array.token = @"hahah";
    
    [array addObject:@""];
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    [array performSelector:@selector(myDynamicMethod:) withObject:nil afterDelay:0];
#pragma clang diagnostic pop
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --- TableView Datasource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WithoutASDKCell" forIndexPath:indexPath];
    
    return cell;
}

@end
