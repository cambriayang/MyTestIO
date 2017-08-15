//
//  NSObject+Swizzle.h
//  ASDKTestOn4S
//
//  Created by CambriaYang on 16/5/22.
//  Copyright © 2016年 CambriaYang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Swizzle)

- (void)swizzleInstanceMethod:(SEL)firstSeletor withMethod:(SEL)targetSeletor;
+ (void)swizzleClassMethod:(SEL)firstSelector withMethod:(SEL)targetSeletor;

@end
