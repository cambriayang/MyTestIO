//
//  LFBlockQueue.m
//  ASDKTestOn4S
//
//  Created by yeyang on 2016/12/6.
//  Copyright © 2016年 CambriaYang. All rights reserved.
//

#import "LFBlockQueue.h"

@interface LFBlockQueue ()

@property (nonatomic, strong) NSMutableArray *array ;
@property (nonatomic, assign) int capacity ;
@property (nonatomic, strong) NSCondition *condition ;

@end

@implementation LFBlockQueue

- (instancetype)init {
    self = [super init];
    
    if (self) {
        id temp = [[NSCondition alloc] init];
        self.condition = temp;
        self.array = [NSMutableArray arrayWithCapacity:self.capacity];
    }
    return self;
}

- (void)put:(id)obj {
    [self.condition lock];
    [self.array addObject:obj ];
    [self.condition signal];
    [self.condition unlock];
}

- (id)copyBlockObject {
    [self.condition lock];
    
    while([self.array count] == 0) {
        [self.condition wait];
    }
    
    id retObj = [self.array objectAtIndex:0];
    
    [self.array removeObjectAtIndex:0];
    
    [self.condition unlock];
    
    return  retObj;
}

- (id)copyBlockObjectWithTimeInterval:(NSUInteger)timerInterval {
    [self.condition lock];
    
    while([self.array count] == 0) {
        if([self.condition waitUntilDate:[NSDate dateWithTimeIntervalSinceNow:timerInterval]] == NO){
            [self.condition unlock];
            return nil;
        }
    }
    
    id retObj = [self.array objectAtIndex:0];
    
    [self.array removeObjectAtIndex:0];
    
    [self.condition unlock];
    
    return retObj;
}

@end
