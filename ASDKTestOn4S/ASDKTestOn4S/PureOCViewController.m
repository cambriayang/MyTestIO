//
//  PureOCViewController.m
//  ASDKTestOn4S
//
//  Created by yeyang on 2017/3/22.
//  Copyright © 2017年 CambriaYang. All rights reserved.
//

#import "PureOCViewController.h"

@interface PureOCViewController ()

@end

@implementation PureOCViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    self.navigationController.navigationBar.hidden = YES;
    
    CGFloat viewWidth = CGRectGetWidth(self.view.frame);
    CGFloat viewHeight = CGRectGetHeight(self.view.frame);
    
    self.view.backgroundColor = [UIColor greenColor];
    
    self.title = NSStringFromClass([self class]);
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake((viewWidth - 50)/2.0, (viewHeight - 50)/2.0, 50, 50)];
    
    view.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:view];
    
    UIView *anotherView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    
    anotherView.backgroundColor = [UIColor blueColor];
    
    [view addSubview:anotherView];
    
    NSLog(@"%@", [[self getViewControllerOfView:anotherView] description]);
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
