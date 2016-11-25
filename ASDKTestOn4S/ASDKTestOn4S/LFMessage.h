//
//  LFMessage.h
//  iosframework
//
//  Created by yeyang on 2016/10/17.
//  Copyright © 2016年 ljs. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, LFMessageType) {
    LFMessageTypeDefault = 0,
    LFMessageTypeVCAction
};

typedef NS_ENUM(NSUInteger, LFMessagePriority) {
    LFMessagePriorityDefault = 0,
    LFMessagePriorityHigh,
    LFMessagePriorityRequired
};

NS_ASSUME_NONNULL_BEGIN

@interface LFMessage : NSObject

@property (nonatomic, copy) NSString *messageID;
@property (nonatomic, copy) NSString *messageName;
@property (nonatomic, assign) LFMessageType messageType;
@property (nonatomic, assign) LFMessagePriority messagePriority;

+ (LFMessage *)messageWithName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END