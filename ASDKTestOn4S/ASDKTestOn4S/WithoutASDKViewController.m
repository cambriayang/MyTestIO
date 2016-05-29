//
//  WithoutASDKViewController.m
//  ASDKTestOn4S
//
//  Created by CambriaYang on 16/3/27.
//  Copyright © 2016年 CambriaYang. All rights reserved.
//

#import "WithoutASDKViewController.h"

#import "NSMutableArray+SafeAdd.h"

@interface WithoutASDKViewController ()

@end

@implementation WithoutASDKViewController

- (void)dealloc {
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.baseTableView registerNib:[UINib nibWithNibName:@"WithoutASDKTableViewCell" bundle:nil] forCellReuseIdentifier:@"WithoutASDKCell"];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dealWithTheNotiFromBackground:) name:TESTNOTIFICATIONINSUBTHREAD object:nil];
    
    NSMutableArray *array = [NSMutableArray array];
    
    [array addObject:@"1"];
    
#warning This is a test code for swizzle. You should never do this in your project!
    [array addObject:nil];
        
    array.token = @"hahah";
    
    NSMutableString *string = [NSMutableString alloc];
    
    __unused NSMutableString *str1 = [string init];
    __unused NSMutableString *str2 = [string initWithCapacity:0];
    __unused NSMutableString *str3 = [string initWithString:@"222"];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    [array performSelector:@selector(myDynamicMethod:) withObject:nil afterDelay:0];
#pragma clang diagnostic pop
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealWithTheNotiFromBackground:(NSNotification *)noti {
}

#pragma mark --- TableView Datasource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WithoutASDKCell" forIndexPath:indexPath];
    
    return cell;
}

@end
