//
//  NSMutableArray+SafeAdd.m
//  ASDKTestOn4S
//
//  Created by CambriaYang on May/21/2016.
//  Copyright © 2016 CambriaYang. All rights reserved.
//

#import "NSMutableArray+SafeAdd.h"

#import <objc/runtime.h>

@implementation NSMutableArray (SafeAdd)

@synthesizeAssociation(NSMutableArray, token);

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL originalSel = @selector(addObject:);
        SEL mySel = @selector(cyAddObject:);
        Class cls = [self class];
        
        Method originalMethod = class_getInstanceMethod(cls, originalSel);
        
        Method myMethod = class_getInstanceMethod(cls, mySel);
        
        __unused BOOL ori = class_addMethod(cls, originalSel, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        __unused BOOL my = class_addMethod(cls, mySel, method_getImplementation(myMethod), method_getTypeEncoding(myMethod));
        
        method_exchangeImplementations(originalMethod, myMethod);
//        if (didAddMethod) {
//            class_replaceMethod(cls, mySel, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
//        } else {
//            method_exchangeImplementations(originalMethod, myMethod);
//        }
    });
}

- (void)cyAddObject:(id)object {
    if (object == nil) {
        [self cyAddObject:@"You have add a nil!"];
    } else {
        [self cyAddObject:object];
    }
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    //If you want te test forwardInvocation & methodSignatureForSelector please close this snippet and open them
    if (sel == @selector(myDynamicMethod:)) {
        class_addMethod([self class], sel, (IMP)dynamicMethodIMP, "v@:");
        
        return YES;
    }
    
    return [super resolveInstanceMethod:sel];
}
#pragma clang diagnostic pop

void dynamicMethodIMP(id self, SEL _cmd) {
    NSLog(@"My Test");
}

//- (void)forwardInvocation:(NSInvocation *)anInvocation {
//    __unused SEL sel = anInvocation.selector;
//    
//    if ([self respondsToSelector:sel]) {
//        [anInvocation invokeWithTarget:self];
//    } else {
//        [super forwardInvocation:anInvocation];
//    }
//}
//
//- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
//    NSMethodSignature *signature = [[NSMethodSignature alloc] init];
//    
//    return signature;
//}

@end
