//
//  BaseViewController.m
//  ASDKTestOn4S
//
//  Created by CambriaYang on 16/3/27.
//  Copyright © 2016年 CambriaYang. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

#pragma mark --- Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.baseTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    self.baseTableView.delegate = self; 
    self.baseTableView.dataSource = self;
    
    UIWindow *window = [[UIWindow alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    
    window.backgroundColor = [UIColor redColor];
    window.windowLevel = UIWindowLevelStatusBar+1;
    
    [window makeKeyAndVisible];
//    [[[[UIApplication sharedApplication] delegate] window] setWindowLevel:UIWindowLevelStatusBar+1];
    
    int i = 3;
   __unused  int m = i+++1;
    
    [self.view addSubview:self.baseTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --- TableView Datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 500;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    @throw [NSException exceptionWithName:@"SubClass did not override this method!" reason:@"===[The Subclass should override this method!!!]===" userInfo:nil];
    
    return nil;
}

#pragma mark --- TableView Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80 +  (arc4random()%100);
}

#pragma mark --- Functional Methods
- (void)printMyClassName {
    NSLog(@"==[In %@]==", [NSString stringWithUTF8String:object_getClassName(self)]);
}

@end
