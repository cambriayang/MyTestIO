//
//  LFMessage.m
//  iosframework
//
//  Created by yeyang on 2016/10/17.
//  Copyright © 2016年 ljs. All rights reserved.
//

#import "LFMessage.h"

@interface LFMessage () {
    @private
    NSMutableArray <__kindof LFMessage *> *innerExcludedMessages;
}

@property (nonatomic, copy, readwrite) NSString *messageID;
@property (nonatomic, copy, readwrite) NSString *messageName;

@end

@implementation LFMessage

#pragma mark --- Init Methods
+ (LFMessage *)messageWithName:(NSString *)name {
    LFMessage *message = [[LFMessage alloc] init];
    
    message.messageName = name;
    message.messageType = LFMessageTypeDefault;
    message.messagePriority = LFMessagePriorityDefault;
    
    [message setValue:nil forKey:@"innerSubMessages"];
    
#warning userID should be true
    NSString *userID = @"xxxxx";
    message.messageID = [NSString stringWithFormat:@"%@_%@", userID, name];
    
    return message;
}

+ (LFMessage *)messageWithName:(NSString *)name subMessages:(NSArray <__kindof LFMessage *> *)subMessages {
    LFMessage *message = [self messageWithName:name];
    
    message.messageType = LFMessageTypeDefault;
    message.messagePriority = LFMessagePriorityDefault;
    
    [message setValue:[NSMutableArray arrayWithArray:subMessages] forKey:@"innerSubMessages"];
    
    return message;
}

+ (LFMessage *)messageWithName:(NSString *)name messageType:(LFMessageType)type messagePriority:(LFMessagePriority)priority {
    LFMessage *message = [self messageWithName:name];
    
    message.messageType = type;
    message.messagePriority = priority;
    
    return message;
}

+ (LFMessage *)messageWithName:(NSString *)name messageType:(LFMessageType)type messagePriority:(LFMessagePriority)priority subMessages:(NSArray <__kindof LFMessage *> *)subMessages {
    LFMessage *message = [self messageWithName:name];
    
    message.messageType = type;
    message.messagePriority = priority;
    
    [message setValue:[NSMutableArray arrayWithArray:subMessages] forKey:@"innerSubMessages"];
    
    return message;
}

- (void)addAction:(MessageAction)action {
    if (action) {
        self.messageAction = action;
    }
}

#pragma mark --- Set & Get
- (NSArray <__kindof LFMessage *> *)innerExcludedMessages {
    if (innerExcludedMessages && innerExcludedMessages.count > 0) {
        return [NSArray arrayWithArray:innerExcludedMessages];
    } else {
        NSLog(@"==[LFMessage(%@): donnot have sub messages]==", self);
        
        return nil;
    }
}

@end
