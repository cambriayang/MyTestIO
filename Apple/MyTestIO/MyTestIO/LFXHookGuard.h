//
//  LFXHookGuard.h
//  iOSLaboratory
//
//  Created by yangshansi on 2017/7/20.
//  Copyright © 2017年 WiLL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LFXHookGuard : NSObject

+ (void)swapMethodOfArray;
+ (void)swapMethodsOfMutableArray;
+ (void)swapMethodOfMutableDictionary;

@end



@interface NSArray (HookGuard)

- (id)list0_objectAtIndex:(NSUInteger)index;
- (id)list1_objectAtIndex:(NSUInteger)index;
- (id)listI_objectAtIndex:(NSUInteger)index;

- (id)list0_objectAtIndexedSubscript:(NSUInteger)index;
- (id)list1_objectAtIndexedSubscript:(NSUInteger)index;
- (id)listI_objectAtIndexedSubscript:(NSUInteger)index;

@end




@interface NSMutableArray (HookGuard)

- (id)listM_objectAtIndex:(NSUInteger)index;
- (id)listM_objectAtIndexedSubscript:(NSUInteger)index;

- (void)listM_addObject:(id)object;
- (void)listM_insertObject:(id)object atIndex:(NSUInteger)index;
- (void)listM_setObject:(id)object atIndexedSubscript:(NSUInteger)index;

- (void)listM_removeObjectAtIndex:(NSUInteger)index;

- (void)listM_exchangeObjectAtIndex:(NSUInteger)index1
                  withObjectAtIndex:(NSUInteger)index2;


@end




@interface NSMutableDictionary (HookGuard)

- (void)dictM_setObject:(id)object forKey:(id<NSCopying>)aKey;
- (void)dictM_setObject:(id)object forKeyedSubscript:(id<NSCopying>)key;

@end

