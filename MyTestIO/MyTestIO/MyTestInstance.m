//
//  MyTestInstance.m
//  ASDKTestOn4S
//
//  Created by CambriaYang on 16/9/13.
//  Copyright © 2016年 CambriaYang. All rights reserved.
//

#import "MyTestInstance.h"

@implementation MyTestInstance

+ (instancetype)shareInstance {
    static MyTestInstance *instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[MyTestInstance alloc] _init_];
    });
    
    return instance;
}

- (instancetype)init {
    @throw [NSException exceptionWithName:@"Initial Error" reason:@"This is a singleton!! Wrong Initialization" userInfo:nil];
    
    return [super init];
}

- (instancetype)_init_ {
    self = [super init];
    
    if (self) {
        //Do sth
    }
    
    return self;
}

+ (void)load {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MyTestInstance shareInstance];
    });
}

@end
