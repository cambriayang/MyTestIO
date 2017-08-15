//
//  LFBlockQueue.h
//  ASDKTestOn4S
//
//  Created by yeyang on 2016/12/6.
//  Copyright © 2016年 CambriaYang. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LFMessage.h"

NS_ASSUME_NONNULL_BEGIN

@interface LFBlockQueue : NSObject

- (id)copyBlockObjectWithTimeInterval:(NSUInteger)timerInterval;
- (id)copyBlockObject;
- (void)put:(id)obj;

@end

NS_ASSUME_NONNULL_END
