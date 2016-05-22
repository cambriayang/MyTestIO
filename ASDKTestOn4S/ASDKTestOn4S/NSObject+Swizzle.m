//
//  NSObject+Swizzle.m
//  ASDKTestOn4S
//
//  Created by CambriaYang on 16/5/22.
//  Copyright © 2016年 CambriaYang. All rights reserved.
//

#import "NSObject+Swizzle.h"

#import <objc/objc-runtime.h>

@implementation NSObject (Swizzle)

- (void)swizzleInstanceMethod:(SEL)firstSeletor withMethod:(SEL)targetSeletor {
    Class cls = [self class];
    
    Method firstMethod = class_getInstanceMethod(cls, firstSeletor);
    Method targetMethod = class_getInstanceMethod(cls, targetSeletor);
    
    BOOL didAddMethod = class_addMethod(cls, firstSeletor, method_getImplementation(targetMethod), method_getTypeEncoding(targetMethod));
    
    if (didAddMethod) {
        class_replaceMethod(cls, targetSeletor, method_getImplementation(firstMethod), method_getTypeEncoding(firstMethod));
    } else {
        method_exchangeImplementations(firstMethod, targetMethod);
    }
}

+ (void)swizzleClassMethod:(SEL)firstSelector withMethod:(SEL)targetSeletor {
    
}

@end
