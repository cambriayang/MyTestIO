//
//  BaseViewController.m
//  ASDKTestOn4S
//
//  Created by CambriaYang on 16/3/27.
//  Copyright © 2016年 CambriaYang. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

#pragma mark --- Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.baseTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    self.baseTableView.delegate = self; 
    self.baseTableView.dataSource = self;
    
    [self.view addSubview:self.baseTableView];
    
    [self performSelectorInBackground:@selector(postANotiInBackground) withObject:self];
}

- (void)postANotiInBackground {
    [[NSNotificationCenter defaultCenter] postNotificationName:TESTNOTIFICATIONINSUBTHREAD object:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --- TableView Datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1000;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSAssert(NO, @"The Subclass should overide this method!!!");
    return nil;
}

#pragma mark --- TableView Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100 +  (arc4random()%150);
//    return 200;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
