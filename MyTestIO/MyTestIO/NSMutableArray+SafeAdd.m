//
//  NSMutableArray+SafeAdd.m
//  ASDKTestOn4S
//
//  Created by CambriaYang on May/21/2016.
//  Copyright © 2016 CambriaYang. All rights reserved.
//

#import "NSMutableArray+SafeAdd.h"

#import <objc/runtime.h>
#import "NSObject+Swizzle.h"

@implementation NSMutableArray (SafeAdd)

@synthesizeAssociation(NSMutableArray, token);

/**
 *  The first snappet & second sanppet can both work. The key is the Class.
 *  Because the NSMutableArray is a class belong to a class cluster. So we need
 *  to alloc init for a concrete instance so that complier can know what it is.
 */
+ (void)load {
    /**
     *  1.snappet
     */
    
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        SEL originalSel = @selector(addObject:);
//        SEL mySel = @selector(cyAddObject:);
//        
//        NSMutableArray *array = [[NSMutableArray alloc] init];
//        
//        [array swizzleInstanceMethod:originalSel withMethod:mySel];
//    });

    /**
     *  2.snappet
     */
    
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        SEL originalSel = @selector(addObject:);
//        SEL mySel = @selector(cyAddObject:);
//        Class cls = [[[NSMutableArray alloc] init] class];
//        
//        Method originalMethod = class_getInstanceMethod(cls, originalSel);
//        
//        Method myMethod = class_getInstanceMethod(cls, mySel);
//        
//        //        __unused BOOL ori = class_addMethod(cls, originalSel, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
//        //        __unused BOOL my = class_addMethod(cls, mySel, method_getImplementation(myMethod), method_getTypeEncoding(myMethod));
//        BOOL didAddMethod = class_addMethod(cls, originalSel, method_getImplementation(myMethod), method_getTypeEncoding(myMethod));
//        
//        if (didAddMethod) {
//            class_replaceMethod(cls, mySel, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
//        } else {
//            method_exchangeImplementations(originalMethod, myMethod);
//        }
//        //        [self jr_swizzleMethod:@selector(addObject:) withMethod:@selector(cyAddObject:) error:nil];
//    });
}

- (void)cyAddObject:(id)object {
    if (object == nil) {
        NSLog(@"%s_%s", __FILE__, __FUNCTION__);
        [self cyAddObject:@"You have add a nil!"];
    } else {
        [self cyAddObject:object];
//        NSLog(@"%s_%s", __FILE__, __FUNCTION__);
    }
}

- (void)cyAddObject2:(id)object {
    if (object == nil) {
        NSLog(@"%s_%s", __FILE__, __FUNCTION__);
        [self cyAddObject2:object];
    } else {
        [self cyAddObject2:object];
//        NSLog(@"%s_%s", __FILE__, __FUNCTION__);
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
