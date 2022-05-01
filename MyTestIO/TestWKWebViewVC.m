//
//  TestWKWebViewVC.m
//  MyTestIO
//
//  Created by yeyang on 2018/1/12.
//  Copyright © 2018年 CambriaYang. All rights reserved.
//

#import "TestWKWebViewVC.h"
#import <WebKit/WKWebView.h>
#import <WebKit/WKWebViewConfiguration.h>

@interface TestWKWebViewVC ()
@property (nonatomic,strong) WKWebView *wkWebView;
@end

@implementation TestWKWebViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    [self renderView];
}

- (void)renderView {
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    
    self.wkWebView = [[WKWebView alloc] initWithFrame:CGRectZero configuration:config];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
