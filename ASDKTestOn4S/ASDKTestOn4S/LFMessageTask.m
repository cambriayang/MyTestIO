//
//  LFMessageTask.m
//  iosframework
//
//  Created by yeyang on 2016/10/17.
//  Copyright © 2016年 ljs. All rights reserved.
//

#import "LFMessageTask.h"

#import "LFMessage.h"

@interface LFMessageTask ()

@property (nonatomic, strong) LFMessage *message;

@end

@implementation LFMessageTask

#pragma mark --- Life Cycle
- (void)main {
    @autoreleasepool {
        if (_message && _message.messageAction) {
            _message.messageAction();
        }
    }
}

- (void)dealloc {
    
}

- (instancetype)initWithMessage:(LFMessage *)message {
    self = [super init];
    
    if (self) {
        
    }
    
    return self;
}

- (instancetype)initWithMessage:(LFMessage *)message dependencies:(NSArray <__kindof LFMessageTask *> *)dependencies {
    self = [super init];
    
    if (self) {
        
    }
    
    return self;
}

@end
