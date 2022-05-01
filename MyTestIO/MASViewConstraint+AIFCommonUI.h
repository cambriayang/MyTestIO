//
//  MASViewConstraint+AIFCommonUI.h
//  AIFCommonUI
//
//  Created by Cambria on 2017/10/25.
//

#import <Masonry/MASViewConstraint.h>

@interface MASConstraint (AIFCommonUI)

- (MASConstraint * (^)(void))makeCollapsible;
- (MASConstraint * (^)(CGFloat offset))makeCollapsibleTo;

@end

@interface MASViewConstraint (AIFCommonUI)

//open layoutConstraint up
@property (nonatomic, weak) MASLayoutConstraint *layoutConstraint;
@property (nonatomic, assign) BOOL isCollapsible;
@property (nonatomic, assign) CGFloat collapsedConstant;

@end
