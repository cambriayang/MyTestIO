//
//  PureOCViewController.m
//  ASDKTestOn4S
//
//  Created by yeyang on 2017/3/22.
//  Copyright © 2017年 CambriaYang. All rights reserved.
//

#import "PureOCViewController.h"
#import <Masonry.h>

@interface PureOCViewController ()

@end

@implementation PureOCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    //    [self testAutoLayout];
    //    [self testViews];
    [self testAutoFillOniOS11];
}

- (void)testAutoFillOniOS11 {
    UITextField *f1 = [[UITextField alloc] init];
    
    [self.view addSubview:f1];
    f1.backgroundColor = [UIColor whiteColor];
    if (@available(iOS 11.0, *)) {
        f1.textContentType = UITextContentTypeUsername;
    } else {
        // Fallback on earlier versions
    }
    
    [f1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(self.view.mas_top).offset(100);
        make.size.mas_equalTo(CGSizeMake(150, 50));
    }];
    
    UITextField *f2 = [[UITextField alloc] init];
    
    [self.view addSubview:f2];
    f2.backgroundColor = [UIColor whiteColor];
    f2.secureTextEntry = YES;
    if (@available(iOS 11.0, *)) {
        f2.textContentType = UITextContentTypePassword;
    } else {
        // Fallback on earlier versions
    }
    
    [f2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(self.view.mas_top).offset(160);
        make.size.mas_equalTo(CGSizeMake(150, 50));
    }];
}

- (void)testViews {
    CGFloat viewWidth = CGRectGetWidth(self.view.frame);
    CGFloat viewHeight = CGRectGetHeight(self.view.frame);
    
    self.title = NSStringFromClass([self class]);
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake((viewWidth - 50)/2.0, (viewHeight - 50)/2.0, 50, 50)];
    
    view.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:view];
    
    UIView *anotherView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    
    anotherView.backgroundColor = [UIColor blueColor];
    
    [view addSubview:anotherView];
    
    NSLog(@"%@", [[self getViewControllerOfView:anotherView] description]);
}

- (void)testAutoLayout {
    UILabel *l1 = [[UILabel alloc] init];
    
    l1.text = @"nihaoooooooooooo";
    l1.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:l1];
    
    UILabel *l2 = [[UILabel alloc] init];
    
    l2.text = @"ssssssssssssssssssssssssssssss";
    l2.backgroundColor = [UIColor yellowColor];
    
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

/**
 Get the View 's father ViewController as long as the view is in the Viewcontroller's hierarchy
 
 @param view targetView
 @return father ViewController
 */
- (UIViewController *)getViewControllerOfView:(UIView *)view {
    if ([view superview] == nil) {
        UIResponder *nextResponder = [view nextResponder];
        return  (UIViewController *)nextResponder;
    }
    
    for (UIView* next = [view superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    
    return nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
