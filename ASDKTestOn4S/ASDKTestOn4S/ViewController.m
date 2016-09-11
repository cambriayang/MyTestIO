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

@interface ViewController () <UITextFieldDelegate>

@end

@implementation ViewController

#pragma mark --- Life Cycle
- (void)dealloc {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

#pragma UITextViewDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    UITextRange *selRange = textField.selectedTextRange;
    UITextPosition *selStartPos = selRange.start;
    NSInteger idx = [textField offsetFromPosition:textField.beginningOfDocument toPosition:selStartPos];
    
    NSLog(@"==[%d]==", (int)idx);
    
    return YES;
}

@end
