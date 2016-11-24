//
//  WithoutASDKViewController.m
//  ASDKTestOn4S
//
//  Created by CambriaYang on 16/3/27.
//  Copyright © 2016年 CambriaYang. All rights reserved.
//

#import "WithoutASDKViewController.h"

#import "NSMutableArray+SafeAdd.h"

@interface WithoutASDKViewController () <NSMachPortDelegate>

@property (nonatomic, strong) NSLock *notificationLock;
@property (nonatomic, strong) NSMachPort *notificationPort;
@property (nonatomic, strong) NSThread *expectationThread;
@property (nonatomic, strong) NSMutableArray *notificationArray;

@end

@implementation WithoutASDKViewController

- (void)dealloc {
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.notificationLock = [[NSLock alloc] init];
    
    self.notificationArray = [NSMutableArray array];
    
    self.expectationThread = [NSThread currentThread];
    
    self.notificationPort = [[NSMachPort alloc] init];
    
    self.notificationPort.delegate = self;
    
    //往当前线程的run loop添加端口源, 当Mach消息到达而接收线程的run loop没有运行时，则内核会保存这条消息，直到下一次进入run loop
    [[NSRunLoop currentRunLoop] addPort:self.notificationPort forMode:(__bridge NSString *)kCFRunLoopCommonModes];
    
    [self.baseTableView registerNib:[UINib nibWithNibName:@"WithoutASDKTableViewCell" bundle:nil] forCellReuseIdentifier:@"WithoutASDKCell"];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dealWithTheNotiFromBackground:) name:@"MyNotification" object:nil];
    
    [self performSelectorInBackground:@selector(postANotiInBackground) withObject:self];
    
    NSMutableArray *array = [NSMutableArray array];
    
    [array addObject:@"1"];
    
#pragma mark ---  This is a test code for swizzle. You should never do this in your project!

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wnonnull"
    [array addObject:nil];
#pragma clang diagnostic pop
    
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

- (void)postANotiInBackground {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"MyNotification" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealWithTheNotiFromBackground:(NSNotification *)noti {
    NSThread *thread = [NSThread currentThread];
    NSLog(@"==[%@]==", thread.description);
    
    if (self.expectationThread != thread) {
        [self.notificationLock lock];
        [self.notificationArray addObject:noti];
        [self.notificationLock unlock];
        
        [self.notificationPort sendBeforeDate:[NSDate date] components:nil from:nil reserved:0];
    } else {
        NSLog(@"==[%@]==", [NSThread currentThread].description);
    }
}

#pragma mark --- TableView Datasource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WithoutASDKCell" forIndexPath:indexPath];
    
    return cell;
}

#pragma mark --- NSMachPortDelegate
- (void)handleMachMessage:(void *)msg {
    [self.notificationLock lock];
    
    while (self.notificationArray.count > 0) {
        NSNotification *noti = [self.notificationArray objectAtIndex:0];
        
        [self.notificationArray removeObject:noti];
        
        [self.notificationLock unlock];
        [self dealWithTheNotiFromBackground:noti];
        [self.notificationLock lock];
    }
    
    [self.notificationLock unlock];
}

@end
