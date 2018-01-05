//
//  ViewController.m
//  ASDKTestOn4S
//
//  Created by CambriaYang on 16/3/27.
//  Copyright © 2016年 CambriaYang. All rights reserved.
//

#import "ViewController.h"
#import "MyTestIO-Swift.h"


@interface ViewController () 

@end

@implementation ViewController

#pragma mark --- Life Cycle
- (void)dealloc {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark --- Button Clicked
- (IBAction)gotoMyTestRootV:(id)sender {
    MyTestRootVC *vc = [[MyTestRootVC alloc] init];
    
    [self.navigationController pushViewController:vc animated:YES];
}

@end
