//
//  LFMessage.m
//  iosframework
//
//  Created by yeyang on 2016/10/17.
//  Copyright © 2016年 ljs. All rights reserved.
//

#import "LFMessage.h"

@implementation LFMessage

+ (LFMessage *)messageWithName:(NSString *)name {
    LFMessage *message = [[LFMessage alloc] init];
    
    message.messageName = name;
    message.messageType = LFMessageTypeDefault;
    message.messagePriority = LFMessagePriorityDefault;
    
    return message;
}

@end
