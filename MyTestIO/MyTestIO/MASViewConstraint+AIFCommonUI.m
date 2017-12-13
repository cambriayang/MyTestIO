//
//  MASViewConstraint+AIFCommonUI.m
//  AIFCommonUI
//
//  Created by Cambria on 2017/10/25.
//

#import "MASViewConstraint+AIFCommonUI.h"
#import "UIView+AIFAutoCollapse.h"

@implementation MASConstraint (AIFCommonUI)

- (MASConstraint *(^)(void))makeCollapsible
{
    return ^id(){
        if (![self respondsToSelector:@selector(setIsCollapsible:)]) {
            return self;
        }
        MASViewConstraint *constraint = (MASViewConstraint *)self;
        constraint.isCollapsible = YES;
        return self;
    };
}

- (MASConstraint *(^)(CGFloat))makeCollapsibleTo
{
    return ^id(CGFloat collapsedConstant){
        if (![self respondsToSelector:@selector(setIsCollapsible:)]) {
            return self;
        }
        MASViewConstraint *constraint = (MASViewConstraint *)self;
        constraint.isCollapsible = YES;
        constraint.collapsedConstant = collapsedConstant;
        return self;
    };
}

@end

@implementation MASViewConstraint (AIFCommonUI)
@dynamic layoutConstraint;
//@synthesizeAssociationCType(MASViewConstraint, isCollapsible, BOOL);
//@synthesizeAssociationCType(MASViewConstraint, collapsedConstant, CGFloat);

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        method_exchangeImplementations(class_getInstanceMethod(MASViewConstraint.class, @selector(install)),
                                       class_getInstanceMethod(MASViewConstraint.class, @selector(aif_install)));
        
        method_exchangeImplementations(class_getInstanceMethod(MASViewConstraint.class, @selector(uninstall)),
                                       class_getInstanceMethod(MASViewConstraint.class, @selector(aif_uninstall)));
    });
}

- (BOOL)isCollapsible {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setIsCollapsible:(BOOL)isCollapsible {
    objc_setAssociatedObject(self, _cmd, @(isCollapsible), OBJC_ASSOCIATION_ASSIGN);
}

- (CGFloat)collapsedConstant {
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}

- (void)setCollapsedConstant:(CGFloat)collapsedConstant {
    objc_setAssociatedObject(self, _cmd, @(collapsedConstant), OBJC_ASSOCIATION_ASSIGN);
}

- (void)aif_install
{
    [self aif_install];
    if (self.isCollapsible) {
        UIView *view = self.firstViewAttribute.view;
        NSMutableArray *array = [[view aif_collapsibleConstraints] mutableCopy] ?: [NSMutableArray array];
        if ([self layoutConstraint]) {
            [[self layoutConstraint] setCollapsedConstant:self.collapsedConstant];
            [array addObject:[self layoutConstraint]];
        }
        view.aif_collapsibleConstraints = [array copy];
    }
}

- (void)aif_uninstall
{
    if (self.isCollapsible) {
        UIView *view = self.firstViewAttribute.view;
        if ([view aif_collapsibleConstraints] && [self layoutConstraint]) {
            NSMutableArray *array = [[view aif_collapsibleConstraints] mutableCopy];
            [array removeObject:[self layoutConstraint]];
            view.aif_collapsibleConstraints = [array copy];
        }
    }
    [self aif_uninstall];
}

@end
