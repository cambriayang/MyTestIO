//
//  LFXHookGuard.m
//  iOSLaboratory
//
//  Created by yangshansi on 2017/7/20.
//  Copyright © 2017年 WiLL. All rights reserved.
//

#import "LFXHookGuard.h"

#import "JRSwizzle.h"



@interface LFXHookGuard ()

@end



@implementation LFXHookGuard


/******************************************************************************/
/***** Static Method - Utility                                            *****/
/******************************************************************************/
#pragma mark - Static Method - Utility

+ (void)swapMethodOfArray
{
    Class list0 = [@[] class];
    [list0 jr_swizzleMethod:@selector(objectAtIndex:)
                 withMethod:@selector(list0_objectAtIndex:)
                      error:nil];
    
    [list0 jr_swizzleMethod:@selector(objectAtIndexedSubscript:)
                 withMethod:@selector(list0_objectAtIndexedSubscript:)
                      error:nil];
    
    Class list1 = [@[@1] class];
    [list1 jr_swizzleMethod:@selector(objectAtIndex:)
                 withMethod:@selector(list1_objectAtIndex:)
                      error:nil];
    
    [list1 jr_swizzleMethod:@selector(objectAtIndexedSubscript:)
                 withMethod:@selector(list1_objectAtIndexedSubscript:)
                      error:nil];
    
    Class listI = [@[@1, @2] class];
    [listI jr_swizzleMethod:@selector(objectAtIndex:)
                 withMethod:@selector(listI_objectAtIndex:)
                      error:nil];
    
    [listI jr_swizzleMethod:@selector(objectAtIndexedSubscript:)
                 withMethod:@selector(listI_objectAtIndexedSubscript:)
                      error:nil];
    
}

+ (void)swapMethodsOfMutableArray
{
    Class listM = [[@[] mutableCopy] class];
    [listM jr_swizzleMethod:@selector(objectAtIndex:)
                 withMethod:@selector(listM_objectAtIndex:)
                      error:nil];
    
    [listM jr_swizzleMethod:@selector(objectAtIndexedSubscript:)
                 withMethod:@selector(listM_objectAtIndexedSubscript:)
                      error:nil];
    
    [listM jr_swizzleMethod:@selector(addObject:)
                 withMethod:@selector(listM_addObject:)
                      error:nil];
    
    [listM jr_swizzleMethod:@selector(insertObject:atIndex:)
                 withMethod:@selector(listM_insertObject:atIndex:)
                      error:nil];
    
    [listM jr_swizzleMethod:@selector(setObject:atIndexedSubscript:)
                 withMethod:@selector(listM_setObject:atIndexedSubscript:)
                      error:nil];
    
    [listM jr_swizzleMethod:@selector(removeObjectAtIndex:)
                 withMethod:@selector(listM_removeObjectAtIndex:)
                      error:nil];
    
    [listM jr_swizzleMethod:@selector(exchangeObjectAtIndex:withObjectAtIndex:)
                 withMethod:@selector(listM_exchangeObjectAtIndex:withObjectAtIndex:)
                      error:nil];
}

+ (void)swapMethodOfMutableDictionary
{
    Class dictM = [[NSMutableDictionary dictionary] class];
    NSLog(@"dictM = %@", dictM);
    [dictM jr_swizzleMethod:@selector(setObject:forKey:)
                 withMethod:@selector(dictM_setObject:forKey:)
                      error:nil];
    
    [dictM jr_swizzleMethod:@selector(setObject:forKey:)
                 withMethod:@selector(dictM_setObject:forKeyedSubscript:)
                      error:nil];
}



/******************************************************************************/
/***** System - Default Lifecycle                                         *****/
/******************************************************************************/
#pragma mark - System - Default Lifecycle

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)dealloc
{
    
}


/******************************************************************************/
/***** Customized - HTTP Request Handler                                  *****/
/******************************************************************************/
#pragma mark - Customized - HTTP Request Handler

/******************************************************************************/
/***** Customized -  Business Logic                                       *****/
/******************************************************************************/
#pragma mark - Customized - Business Logic



@end



@implementation NSArray (HookGuard)

- (id)list0_objectAtIndex:(NSUInteger)index
{
    if (self == nil || self.count == 0 || index >= self.count) {
        return nil;
    }
    return [self list0_objectAtIndex:index];
}

- (id)list1_objectAtIndex:(NSUInteger)index
{
    if (self == nil || self.count == 0 || index >= self.count) {
        return nil;
    }
    return [self list1_objectAtIndex:index];
}

- (id)listI_objectAtIndex:(NSUInteger)index
{
    if (self == nil || self.count == 0 || index >= self.count) {
        return nil;
    }
    return [self listI_objectAtIndex:index];
}

- (id)list0_objectAtIndexedSubscript:(NSUInteger)index
{
    if (self == nil || self.count == 0 || index >= self.count) {
        return nil;
    }
    return [self list0_objectAtIndexedSubscript:index];
}

- (id)list1_objectAtIndexedSubscript:(NSUInteger)index
{
    if (self == nil || self.count == 0 || index >= self.count) {
        return nil;
    }
    return [self list1_objectAtIndexedSubscript:index];
}

- (id)listI_objectAtIndexedSubscript:(NSUInteger)index
{
    if (self == nil || self.count == 0 || index >= self.count) {
        return nil;
    }
    return [self listI_objectAtIndexedSubscript:index];
}

@end



@implementation NSMutableArray (HookGuard)

- (id)listM_objectAtIndex:(NSUInteger)index
{
    if (self == nil || self.count == 0 || index >= self.count) {
        return nil;
    }
    return [self listM_objectAtIndex:index];
}

- (id)listM_objectAtIndexedSubscript:(NSUInteger)index
{
    if (self == nil || self.count == 0 || index >= self.count) {
        return nil;
    }
    return [self listM_objectAtIndexedSubscript:index];
}

- (void)listM_addObject:(id)object
{
    if (object == nil) {
        NSLog(@"%@", [NSThread callStackSymbols]);
        return;
    }
    [self listM_addObject:object];
}

- (void)listM_insertObject:(id)object atIndex:(NSUInteger)index
{
    if (object == nil) {
        NSLog(@"%@--%@--%@", [NSThread callStackSymbols][0], [NSThread callStackSymbols][1], [NSThread callStackSymbols][2]);
        return;
    }
    if (index > self.count) {
        return;
    }
    [self listM_insertObject:object atIndex:index];
}

- (void)listM_setObject:(id)object atIndexedSubscript:(NSUInteger)index
{
    if (object == nil) {
        return;
    }
    if (index > self.count) {
        return;
    }
    [self listM_setObject:object atIndexedSubscript:index];
}

- (void)listM_removeObjectAtIndex:(NSUInteger)index
{
    if (index >= self.count) {
        return;
    }
    [self listM_removeObjectAtIndex:index];
}

- (void)listM_exchangeObjectAtIndex:(NSUInteger)index1
                  withObjectAtIndex:(NSUInteger)index2
{
    if (index1 >= self.count) {
        return;
    }
    if (index2 >= self.count) {
        return;
    }
    [self listM_exchangeObjectAtIndex:index1
                    withObjectAtIndex:index2];
}

@end




@implementation NSMutableDictionary (HookGuard)

- (void)dictM_setObject:(id)object forKey:(id<NSCopying>)key
{
    if (key == nil) {
        return;
    }
    if (object == nil) {
        return;
    }
    
    [self dictM_setObject:object forKey:key];
}

- (void)dictM_setObject:(id)object forKeyedSubscript:(id<NSCopying>)key
{
    if (key == nil) {
        return;
    }
    if (object == nil) {
        return;
    }
    
    [self dictM_setObject:object forKeyedSubscript:key];
}

@end


