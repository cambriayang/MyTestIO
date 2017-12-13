//
//  UIView+AIFAutoCollapse.m
//  AIFCommonUI
//
//  Created by Cambria on 2017/10/25.
//

#import "UIView+AIFAutoCollapse.h"
#import <Masonry/Masonry.h>
#import <objc/runtime.h>

@implementation NSLayoutConstraint (AIFAutoCollapse)

- (void)setAif_originalConstant:(CGFloat)originalConstant
{
    objc_setAssociatedObject(self, @selector(aif_originalConstant), @(originalConstant), OBJC_ASSOCIATION_RETAIN);
}

- (CGFloat)aif_originalConstant
{
#if CGFLOAT_IS_DOUBLE
    return [objc_getAssociatedObject(self, _cmd) doubleValue];
#else
    return [objc_getAssociatedObject(self, _cmd) floatValue];
#endif
}

- (CGFloat)collapsedConstant {
#if CGFLOAT_IS_DOUBLE
    return [objc_getAssociatedObject(self, _cmd) doubleValue];
#else
    return [objc_getAssociatedObject(self, _cmd) floatValue];
#endif
}

- (void)setCollapsedConstant:(CGFloat)collapsedConstant {
    objc_setAssociatedObject(self, @selector(collapsedConstant), @(collapsedConstant), OBJC_ASSOCIATION_RETAIN);
}

@end

@implementation UIView (AIFAutoCollapse)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = UIView.class;
        Method originalMethod = class_getInstanceMethod(class, @selector(setHidden:));
        Method swizzledMethod = class_getInstanceMethod(class, @selector(aif_setHidden:));
        
        method_exchangeImplementations(originalMethod, swizzledMethod);
    });
}

- (BOOL)aif_collapsed {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setAif_collapsed:(BOOL)collapsed {
    [self.aif_collapsibleConstraints enumerateObjectsUsingBlock:
     ^(NSLayoutConstraint *constraint, NSUInteger idx, BOOL *stop) {
         if (collapsed) {
             constraint.constant = constraint.collapsedConstant;
         } else {
             constraint.constant = constraint.aif_originalConstant;
         }
     }];
    
    objc_setAssociatedObject(self, @selector(aif_collapsed), @(collapsed), OBJC_ASSOCIATION_RETAIN);
    [self updateCollapseContraintsIfNeeded];
}

- (NSArray *)aif_collapsibleConstraints {
    NSMutableArray *constraints = objc_getAssociatedObject(self, _cmd);
    if (!constraints) {
        constraints = [NSMutableArray array];
        objc_setAssociatedObject(self, _cmd, constraints, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return constraints;
}

- (void)setAif_collapsibleConstraints:(NSArray *)aif_collapsibleConstraints {
    [aif_collapsibleConstraints enumerateObjectsUsingBlock:^(NSLayoutConstraint *constraint, NSUInteger idx, BOOL * _Nonnull stop) {
        // Store original constant value
        constraint.aif_originalConstant = constraint.constant;
    }];
    objc_setAssociatedObject(self, @selector(aif_collapsibleConstraints), aif_collapsibleConstraints, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)aif_collapseWhenHidden {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setAif_collapseWhenHidden:(BOOL)collapseWhenHidden {
    objc_setAssociatedObject(self, @selector(aif_collapseWhenHidden), @(collapseWhenHidden), OBJC_ASSOCIATION_RETAIN);
    if (self.aif_collapsed == NO && collapseWhenHidden && self.isHidden) {
        self.aif_collapsed = YES;
    }
}

- (void)aif_setHidden:(BOOL)hidden {
    if (self.hidden == hidden) {
        [self aif_setHidden:hidden];
        return;
    }
    [self aif_setHidden:hidden];
    if ([self aif_collapseWhenHidden]) {
        self.aif_collapsed = hidden;
    }
}

- (void)updateCollapseContraintsIfNeeded {
    if ([self aif_collapseSizeConsraint]) {
        [[self aif_collapseSizeConsraint] uninstall];
        [self setAif_collapseSizeConsraint:nil];
    }
    
    if (self.aif_collapsed) {
        [self mas_makeConstraints:^(MASConstraintMaker *make) {
            [self setAif_collapseSizeConsraint:make.width.height.equalTo(@0)];
        }];
    }
}

- (void)setAif_collapseSizeConsraint:(MASConstraint *)collapseSizeConsraint {
    objc_setAssociatedObject(self, @selector(aif_collapseSizeConsraint), collapseSizeConsraint, OBJC_ASSOCIATION_RETAIN);
}

- (MASConstraint *)aif_collapseSizeConsraint {
    return objc_getAssociatedObject(self, _cmd);
}

@end
