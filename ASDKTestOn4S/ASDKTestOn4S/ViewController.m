//
//  ViewController.m
//  ASDKTestOn4S
//
//  Created by CambriaYang on 16/3/27.
//  Copyright © 2016年 CambriaYang. All rights reserved.
//

#import "ViewController.h"

#import "WithASDKViewController.h"
#import "WithoutASDKViewController.h"
#import "ASDKTestOn4S-Swift.h"
#import "JKTest.h"

@interface ViewController () 

@end

@implementation ViewController

#pragma mark --- Life Cycle
- (void)dealloc {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    JKTest *test = [JKTest new];
    
    @try {
        [test setValue:@"KVC" forKey:@"_objjj"];
        [test valueForKey:@"_objjj"];
    } @catch (NSException *exception) {
        NSLog(@"==[%@]==", exception.description);
    } @finally {
        NSLog(@"==[%@]==", test.object);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark --- Button Clicked
- (IBAction)withoutASDKClicked:(id)sender {
    WithoutASDKViewController *vc = [[WithoutASDKViewController alloc] init];
//    SwiftWithoutASDK *vc = [[SwiftWithoutASDK alloc] init];
//    [vc helloWorld];
    
    vc.title = @"WithoutASDK";
        
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)withASDK:(id)sender {
    WithASDKViewController *vc = [[WithASDKViewController alloc] init];
 
    vc.title = @"WithASDK";
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)gotoMyTestRootV:(id)sender {
    MyTestRootVC *vc = [[MyTestRootVC alloc] init];
    
    [self.navigationController pushViewController:vc animated:YES];
}

@end
