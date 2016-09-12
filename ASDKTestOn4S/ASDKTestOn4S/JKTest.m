//
//  JKTest.m
//  ASDKTestOn4S
//
//  Created by CambriaYang on 16/9/12.
//  Copyright © 2016年 CambriaYang. All rights reserved.
//

#import "JKTest.h"

@implementation JKTest

@synthesize object = _obj;

- (void)setObject:(id)object {
    _obj = object;
    
    NSLog(@"==[%s]==", __func__);
}

- (id)object {
    NSLog(@"==[%s]==", __func__);
    
    return _obj;
}

+ (BOOL)accessInstanceVariablesDirectly {
    NSLog(@"==[%s]==", __func__);
    
    return NO;
    return [super accessInstanceVariablesDirectly];
}

- (id)valueForKey:(NSString *)key {
    NSLog(@"==[%s]==", __func__);
    
    return [super valueForKey:key];
}

- (void)setValue:(id)value forKey:(NSString *)key {
    NSLog(@"==[%s]==", __func__);
    
    [super setValue:value forKey:key];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    NSLog(@"==[%s]==", __func__);
    
    if ([key isEqualToString:@"_obj"]) {
        self.object = @"cvK";
    } else {
        self.object = @"VCK";
    }
}

- (id)valueForUndefinedKey:(NSString *)key {
    NSLog(@"==[%s]==", __func__);
    
    return self.object;
}

@end
