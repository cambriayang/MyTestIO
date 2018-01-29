//
//  TestActivitiyVC.m
//  MyTestIO
//
//  Created by yeyang on 2018/1/29.
//  Copyright © 2018年 CambriaYang. All rights reserved.
//

#import "TestActivitiyVC.h"

@interface TestActivitiyVC ()
@property (nonatomic,strong) UIActivityViewController *activityViewController;
@end

@implementation TestActivitiyVC

- (void)dealloc {
    NSLog(@"===UIActivityViewController Dealloc");
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor lightGrayColor];
    
    [self renderView];
}

- (void)renderView {
    NSString *string = @"www.baidu.com";
    NSURL *URL = [NSURL URLWithString:string];
    
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[string, URL]
                                                                                         applicationActivities:nil];
    
    activityViewController.excludedActivityTypes = @[UIActivityTypePostToFacebook];
    
    [self.navigationController presentViewController:activityViewController
                                       animated:YES
                                     completion:^{
                                         NSLog(@"===UIActivityViewController Done");
                                     }];
    
    self.activityViewController = activityViewController;
}

@end
