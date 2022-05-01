//
//  TestBindScrollViewVC.m
//  MyTestIO
//
//  Created by yeyang on 2018/1/12.
//  Copyright © 2018年 CambriaYang. All rights reserved.
//

#import "TestBindScrollViewVC.h"
#import "MyTestBindScrollView.h"

@interface TestBindScrollViewVC ()

@end

@implementation TestBindScrollViewVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor lightGrayColor];
    
    MyTestBindScrollView *tview = [MyTestBindScrollView new];
    
    [self.view addSubview:tview];
    
    [tview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
