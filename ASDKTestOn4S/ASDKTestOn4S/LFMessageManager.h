//
//  LFMessageManager.h
//  iosframework
//
//  Created by yeyang on 2016/10/17.
//  Copyright © 2016年 ljs. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class LFMessage;

@interface LFMessageManager : NSObject

+ (instancetype)shareInstance;

- (void)setMaxConcurrentNumber:(NSInteger)count;

@end

NS_ASSUME_NONNULL_END
