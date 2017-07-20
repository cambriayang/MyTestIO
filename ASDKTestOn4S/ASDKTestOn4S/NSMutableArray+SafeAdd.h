//
//  NSMutableArray+SafeAdd.h
//  ASDKTestOn4S
//
//  Created by CambriaYang on May/21/2016.
//  Copyright © 2016 CambriaYang. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "extobjc.h"

@interface NSMutableArray (SafeAdd)

@property (nonatomic, copy) NSString *token;

- (void)cyAddObject2:(id)object;
- (void)cyAddObject:(id)object;

@end
