//
//  MyTestBindScrollView.m
//  MyTestIO
//
//  Created by yeyang on 2018/1/2.
//  Copyright © 2018年 CambriaYang. All rights reserved.
//

#import "MyTestBindScrollView.h"
#import <WebKit/WebKit.h>

CGFloat defaultRowCount = 10;
CGFloat defaultRowHeight = 20;
CGFloat defaultSectionCount = 1;

#define defaultTableH ((defaultRowCount)*(defaultRowHeight))

@interface MyTestBindScrollView () <WKUIDelegate, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>
@property (nonatomic,strong) UIView *containerView;
@property (nonatomic,strong) WKWebView *webView;
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation MyTestBindScrollView

- (void)dealloc {
    self.webView.UIDelegate = nil;
    self.containerView = nil;
}

- (instancetype)init {
    self = [super init];
    
    if (self) {
        [self initData];
        [self renderView];
    }
    
    return self;
}

- (void)initData {
    defaultRowCount = 10;
    defaultRowHeight = 20;
}

- (void)renderView {
    WKWebView *web = [[WKWebView alloc] init];
    
    [self addSubview:web];
    
    [web mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    self.webView = web;
  
    NSString *urlStr = @"http://www.qingpingshan.com/rjbc/ios/142768.html";
    
    NSString *encodedString = [urlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSURL *weburl = [NSURL URLWithString:encodedString];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:weburl];
    
    [web loadRequest:request];
    
    web.UIDelegate = self;
    
    UIScrollView *myScrollView = self.webView.scrollView;
    
    UIView *containerView = [UIView new];
    
    [myScrollView addSubview:containerView];
    
    [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(myScrollView);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
        make.height.mas_equalTo(defaultTableH);
    }];
    
    self.containerView = containerView;
    
    UITableView *tableview = [UITableView new];
    
    [self.containerView addSubview:tableview];
    
    self.tableView = tableview;
    self.tableView.scrollEnabled = NO;
    
    tableview.delegate = self;
    tableview.dataSource = self;
    tableview.showsVerticalScrollIndicator = NO;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return defaultSectionCount;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return defaultRowHeight;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return defaultRowCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    static NSInteger __instance = 0;
    NSInteger commandId = __instance % (1024*1024);
    __instance++;
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", (long)commandId];
    
    return cell;
}

- (void)resizeWebContentHeight:(CGFloat)contentHeight {
    [self.containerView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(contentHeight+defaultTableH);
    }];
    
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.containerView.mas_width);
        make.height.mas_equalTo(defaultTableH);
        make.bottom.mas_equalTo(self.containerView.mas_bottom);
    }];
}

@end
