//
//  TestLayoutAnimationViewController.m
//  MyTestIO
//
//  Created by yeyang on 2018/1/5.
//  Copyright © 2018年 CambriaYang. All rights reserved.
//

#import "TestLayoutAnimationViewController.h"

@interface TestLayoutAnimationViewController ()
@property (nonatomic,strong) UILabel *label;
@property (nonatomic,strong) UIView *blueBlock;
@property (nonatomic,strong) MASConstraint *labelTopOffset;
@property (nonatomic,strong) MASConstraint *blueBlockTopOffset;
@property (nonatomic,strong) MASConstraint *blueBlockLeftOffset;
@end

@implementation TestLayoutAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    UILabel *label = [UILabel new];
    
    label.text = @"Test";
    label.textColor = [UIColor redColor];
    
    [self.view addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        self.labelTopOffset = make.top.equalTo(self.view.mas_top).offset(160);
        make.centerX.equalTo(self.view.mas_centerX);
    }];
    
    self.label = label;
    
    UIView *blueBlock = [UIView new];
    
    [self.view addSubview:blueBlock];
    
    blueBlock.backgroundColor = [UIColor blueColor];
    
    [blueBlock mas_makeConstraints:^(MASConstraintMaker *make) {
        self.blueBlockTopOffset = make.top.equalTo(label.mas_bottom).offset(10);
        self.blueBlockLeftOffset = make.left.equalTo(label.mas_left);
        make.size.mas_equalTo(CGSizeMake(100, 60));
    }];
    
    self.blueBlock = blueBlock;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setTitle:@"Click" forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).offset(-20);
        make.size.mas_equalTo(CGSizeMake(100, 50));
        make.centerX.equalTo(self.view.mas_centerX);
    }];
}

- (void)clicked:(UIButton *)btn {
    [UIView animateWithDuration:2.0 animations:^{
        //        [self.label mas_remakeConstraints:^(MASConstraintMaker *make) {
        //            make.top.equalTo(self.view.mas_top).offset(260);
        //            make.centerX.equalTo(self.view.mas_centerX);
        //        }];
        self.labelTopOffset.offset = 260;
        self.label.alpha = 0.5;
        
        //        [self.blueBlock mas_remakeConstraints:^(MASConstraintMaker *make) {
        //            make.top.equalTo(self.label.mas_bottom).offset(20);
        //            make.left.equalTo(self.label.mas_left).offset(50);
        //            make.size.mas_equalTo(CGSizeMake(100, 60));
        //        }];
        self.blueBlockTopOffset.offset = 20;
        self.blueBlockLeftOffset.offset = 50;
        self.label.alpha = 0.7;
        
//        //下一个runloop可以改变frame，并且如果在动画block里面，可以直接用
//        dispatch_async(dispatch_get_main_queue(), ^{
//            self.label.frame = CGRectMake(0, 260, 100, 100);
//        });
        
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        NSLog(@"Done");
    }];
}

@end
