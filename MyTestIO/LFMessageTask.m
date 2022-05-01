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
@property (atomic, strong) NSArray <__kindof LFMessage *> *siblings;

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

- (instancetype)init {
    @throw [NSException exceptionWithName:[NSString stringWithFormat:@"==[Wrong Initialization: %s]==", __FUNCTION__] reason:@"==[Pleas use '+initWithMessage' initializer]==" userInfo:nil];
    
    return [super init];
}

- (instancetype)initWithMessage:(LFMessage *)message {
    self = [super init];
    
    if (self) {
        self.message = _message;
    }
    
    return self;
}

- (instancetype)initWithMessage:(LFMessage *)message dependencies:(NSArray <__kindof LFMessageTask *> *)dependencies {
    self = [super init];
    
    if (self) {
        
    }
    
    return self;
}

- (LFMessage *)getMessage {
    return _message;
}

@end
