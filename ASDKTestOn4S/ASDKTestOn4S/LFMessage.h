//
//  LFMessage.h
//  iosframework
//
//  Created by yeyang on 2016/10/17.
//  Copyright © 2016年 ljs. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class LFMessage;

typedef void (^MessageAction) (void);

typedef NS_ENUM(NSUInteger, LFMessageType) {
    LFMessageTypeDefault = 0,
    LFMessageTypeVCAction
};

typedef NS_ENUM(NSUInteger, LFMessagePriority) {
    LFMessagePriorityDefault = 0,
    LFMessagePriorityHigh,
    LFMessagePriorityRequired
};

@interface LFMessage : NSObject

@property (nonatomic, copy, readonly) NSString *messageID;
@property (nonatomic, copy, readonly) NSString *messageName;
@property (nonatomic, copy) MessageAction messageAction;
@property (nonatomic, assign) LFMessageType messageType;
@property (nonatomic, assign) LFMessagePriority messagePriority;
@property (nonatomic, strong, readonly) NSArray <__kindof LFMessage *> *excludedMessages;

+ (LFMessage *)messageWithName:(NSString *)name;
+ (LFMessage *)messageWithName:(NSString *)name excludedMessages:(NSArray <__kindof LFMessage *> *)excludedMessages;
+ (LFMessage *)messageWithName:(NSString *)name messageType:(LFMessageType)type messagePriority:(LFMessagePriority)priority;
+ (LFMessage *)messageWithName:(NSString *)name messageType:(LFMessageType)type messagePriority:(LFMessagePriority)priority excludedMessages:(NSArray <__kindof LFMessage *> *)excludedMessages;

- (void)addAction:(MessageAction)action;

@end

NS_ASSUME_NONNULL_END
