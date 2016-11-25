//
//  LFMessageManager.h
//  iosframework
//
//  Created by yeyang on 2016/10/17.
//  Copyright © 2016年 ljs. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LFMessage.h"



@interface LFMessageManager : NSObject

+ (instancetype)shareInstance;

- (void)registerMessage:(LFMessage *)message Target:(id)target Hander:(SEL)selector;

- (void)sendMessage:(NSString *)messageName;

- (void)setMaxConcurrentNumber:(NSInteger *)count;

@end
