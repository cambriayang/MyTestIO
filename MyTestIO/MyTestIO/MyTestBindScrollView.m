//
//  MyTestBindScrollView.m
//  MyTestIO
//
//  Created by yeyang on 2018/1/2.
//  Copyright © 2018年 CambriaYang. All rights reserved.
//

#import "MyTestBindScrollView.h"

CGFloat defaultRowCount = 10;
CGFloat defaultRowHeight = 20;
CGFloat defaultSectionCount = 1;

#define defaultTableH ((defaultRowCount)*(defaultRowHeight))

@interface MyTestBindScrollView () <UIWebViewDelegate, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>
@property (nonatomic,strong) UIView *containerView;
@property (nonatomic,strong) UIWebView *webView;
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation MyTestBindScrollView

- (void)dealloc {
    self.webView.delegate = nil;
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
    UIWebView *web = [[UIWebView alloc] init];
    
    [self addSubview:web];
    
    [web mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.height.mas_equalTo(defaultTableH*2);
    }];
    
    self.webView = web;
  
    NSString *urlStr = @"http://m.thepaper.cn/wifiKey_detail.jsp?contid=1913999&from=wifiKey&fromId=1966555810873344&newsId=26~2490337347993600&docId=26~249033743474688";
    
    NSString *encodedString = [urlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSURL *weburl = [NSURL URLWithString:encodedString];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:weburl];
    
    [web loadRequest:request];
    
    web.delegate = self;
    
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

- (void)webViewDidStartLoad:(UIWebView *)webView {
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    //获取页面高度（像素）
    NSString * clientheight_str = [webView stringByEvaluatingJavaScriptFromString: @"document.body.offsetHeight"];
    float contentH = [clientheight_str floatValue];

    [self resizeWebContentHeight:contentH];
    
    @weakify(self);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        @strongify(self);
        defaultRowCount = 20;
        defaultRowHeight = 60;
        [self.tableView reloadData];
        
        [self resizeWebContentHeight:contentH];
    });
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"******did fail======");
    NSLog(@"******ERROR:%@", error);
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
