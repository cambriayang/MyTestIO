//
//  LFMessageManager.h
//  iosframework
//
//  Created by yeyang on 2016/10/17.
//  Copyright © 2016年 ljs. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LFMessageTask.h"

NS_ASSUME_NONNULL_BEGIN

@class LFMessage;

@interface LFMessageManager : NSObject

+ (instancetype)shareInstance;

- (void)submitTask:(__kindof LFMessageTask *)task;

- (void)submitTasks:(NSArray <__kindof LFMessageTask *> *)tasks;

@end

NS_ASSUME_NONNULL_END
