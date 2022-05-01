//
//  AutolayoutViewController.m
//  MyTestIO
//
//  Created by yeyang on 2018/1/5.
//  Copyright © 2018年 CambriaYang. All rights reserved.
//

#import "AutolayoutViewController.h"

@interface AutolayoutViewController ()

@end

@implementation AutolayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    UILabel *l1 = [[UILabel alloc] init];
    
    l1.text = @"nihaoooooooooooo";
    l1.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:l1];
    
    UILabel *l2 = [[UILabel alloc] init];
    
    l2.text = @"ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss";
    l2.backgroundColor = [UIColor yellowColor];
    l2.preferredMaxLayoutWidth = 100;
    l2.lineBreakMode = NSLineBreakByTruncatingTail;
    l2.numberOfLines = 3;
    
    [self.view addSubview:l2];
    
    UILabel *l3 = [[UILabel alloc] init];
    
    l3.text = @"tttttttttttttttttttttttttt";
    l3.backgroundColor = [UIColor purpleColor];
    
    [self.view addSubview:l3];
    
    [l3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.mas_right).offset(-15.0);
        make.top.equalTo(self.view.mas_top).offset(150.0);
    }];
    
    [l1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(15.0);
        make.top.equalTo(self.view.mas_top).offset(100.0);
    }];
    
    [l2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(l1.mas_right).offset(5.0);
        make.right.equalTo(l3.mas_left).offset(-10.0);
        make.top.equalTo(self.view.mas_top).offset(100.0);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
