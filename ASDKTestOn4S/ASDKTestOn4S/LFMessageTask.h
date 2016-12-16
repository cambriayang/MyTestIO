//
//  LFMessageTask.h
//  iosframework
//
//  Created by yeyang on 2016/10/17.
//  Copyright © 2016年 ljs. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LFMessage;

NS_ASSUME_NONNULL_BEGIN

@interface LFMessageTask : NSOperation

- (instancetype)initWithMessage:(LFMessage *)message;

@end

NS_ASSUME_NONNULL_END
