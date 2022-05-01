//
//  LFMessageManager.m
//  iosframework
//
//  Created by yeyang on 2016/10/17.
//  Copyright © 2016年 ljs. All rights reserved.
//

#import "LFMessageManager.h"

#import <objc/message.h>
#import "LFMessage.h"

@interface LFMessageManager ()

@property (nonatomic, strong) NSOperationQueue *defaultQueue;
@property (nonatomic, strong) NSOperationQueue *vcActionQueue;

@property (atomic, strong) NSMutableArray *defaultPriority;
@property (atomic, strong) NSMutableArray *highPriority;
@property (atomic, strong) NSMutableArray *requiredPriority;

@end

@implementation LFMessageManager

#pragma mark --- Life Cycle
+ (instancetype)shareInstance {
    static LFMessageManager *sharedInstance;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[super allocWithZone:NULL] __init__];
    });
    
    return sharedInstance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    return [self shareInstance];
}

- (instancetype)copyWithZone:(NSZone *)zone {
    return [[self class] shareInstance];
}

- (instancetype)__init__ {
    self = [super init];
    
    if (self) {
        _defaultQueue = [[NSOperationQueue alloc] init];
        
        _vcActionQueue = [[NSOperationQueue alloc] init];
        
        _defaultQueue.maxConcurrentOperationCount = 1;
        _vcActionQueue.maxConcurrentOperationCount = 1;
        
        _defaultPriority = [NSMutableArray array];
        _highPriority = [NSMutableArray array];
        _requiredPriority = [NSMutableArray array];
    }
    
    return self;
}

- (void)submitTask:(__kindof LFMessageTask *)task {
    
}

- (void)submitTasks:(NSArray <__kindof LFMessageTask *> *)tasks {
    
}
//- (void)registerMessage:(LFMessage *)message Target:(id)target Hander:(SEL)selector {
//    objc_setAssociatedObject(message, LFMessageTarget, target, OBJC_ASSOCIATION_ASSIGN);
//    objc_setAssociatedObject(message, LFMessageSelector, NSStringFromSelector(selector), OBJC_ASSOCIATION_COPY);
//    
//    Ivar ivar = class_getInstanceVariable([LFMessage class], [@"messageID" cStringUsingEncoding:NSUTF8StringEncoding]);
    
//    switch (message.messageType) {
//        case LFMessagePriorityDefault:{
//            [self.defaultPriority addObject:message];
//        }
//            break;
//        case LFMessagePriorityHigh:{
//            [self.highPriority addObject:message];
//        }
//            break;
//        case LFMessagePriorityRequired:{
//            [self.requiredPriority addObject:message];
//        }
//            break;
//        default:
//            break;
//    }
//    
//    if (![target respondsToSelector:selector]) {
//        @throw [NSException exceptionWithName:@"Wrong selector" reason:[NSString stringWithFormat:@"==[%@, cannot responds]==", target] userInfo:nil];
//    }
//}

//- (void)sendMessage:(NSString *)messageName {
//    //Required
//    [self.requiredPriority enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        LFMessage *message = (LFMessage *)obj;
//        
//        [self innerSendMessage:message];
//    }];
//    
//    //High
//    [self.highPriority enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        LFMessage *message = (LFMessage *)obj;
//        
//        [self innerSendMessage:message];
//    }];
//    
//    //Low
//    [self.defaultPriority enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        LFMessage *message = (LFMessage *)obj;
//        
//        [self innerSendMessage:message];
//    }];
//}

//- (void)innerSendMessage:(LFMessage *)message {
//    int (*sendMsg)(id, SEL, int) = (int (*)(id, SEL, int))objc_msgSend;
//    
//    NSString *selectorStr = objc_getAssociatedObject(message, LFMessageTarget);
//    
//    id target = objc_getAssociatedObject(message, LFMessageSelector);
//    
//    SEL selector = NSSelectorFromString(selectorStr);
//    
//    sendMsg(target, selector, 0);
//}

@end
