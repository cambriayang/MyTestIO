//
//  UIView+AIFAutoCollapse.h
//  AIFCommonUI
//
//  Created by Cambria on 2017/10/25.
//

#import <UIKit/UIKit.h>

@interface UIView (AIFAutoCollapse)

@property (nonatomic, assign) BOOL aif_collapsed;
@property (nonatomic, assign) IBInspectable BOOL aif_collapseWhenHidden;

@property (nonatomic, copy) IBOutletCollection(NSLayoutConstraint) NSArray *aif_collapsibleConstraints;

@end

@interface NSLayoutConstraint (AIFAutoCollapse)

//Default to zero
@property (nonatomic, assign) IBInspectable CGFloat collapsedConstant;

@end
