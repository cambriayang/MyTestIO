//
//  TestCycleAnimationViewController.m
//  MyTestIO
//
//  Created by Argost on 2022/8/31.
//  Copyright © 2022 CambriaYang. All rights reserved.
//

#import "TestCycleAnimationViewController.h"

@interface CardView ()
@property (nonatomic,strong) UIView *contentView1;
@property (nonatomic,strong) UIView *square1;
@property (nonatomic,strong) UILabel *desc1;
@property (nonatomic,strong) UIView *contentView2;
@property (nonatomic,strong) UIView *square2;
@property (nonatomic,strong) UILabel *desc2;
@property (nonatomic,strong) NSTimer *timer1;
@property (nonatomic,strong) NSTimer *timer2;
@end

@implementation CardView
- (void)startAnimation {
    if (self.timer1==nil) {
        self.timer1=[NSTimer scheduledTimerWithTimeInterval:3.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
            [UIView animateWithDuration:3.0 animations:^{
                self.contentView1.transform=CGAffineTransformMakeScale(0.1, 0.1);
                self.contentView1.alpha=0;
                self.contentView2.transform=CGAffineTransformIdentity;
                self.contentView2.alpha=1;
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:3.0 animations:^{
                    self.contentView1.transform=CGAffineTransformIdentity;
                    self.contentView1.alpha=1;
                    self.contentView2.transform=CGAffineTransformMakeScale(0.1, 0.1);
                    self.contentView2.alpha=0;
                }];
            }];
        }];
        
        [[NSRunLoop mainRunLoop] addTimer:self.timer1 forMode:NSRunLoopCommonModes];
        [self.timer1 fire];
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (ino64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [self.timer1 fire];
//        });
    }
    
//    if (self.timer2==nil) {
//        self.timer2=[NSTimer scheduledTimerWithTimeInterval:3.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
//            [UIView animateWithDuration:1.0 animations:^{
//                self.contentView1.transform=CGAffineTransformIdentity;
//                self.contentView1.alpha=1;
//                self.contentView2.transform=CGAffineTransformMakeScale(0.2, 0.2);
//                self.contentView2.alpha=0;
//            }];
//        }];
//
//        [[NSRunLoop mainRunLoop] addTimer:self.timer2 forMode:NSRunLoopCommonModes];
//
////        [self.timer2 fire];
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (ino64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [self.timer2 fire];
//        });
//    }
}

- (instancetype)init {
    if (self=[super init]) {
        [self configUI];
    }
    return self;
}

- (void)configUI {
    [self addSubview:self.contentView2];
    [self addSubview:self.contentView1];
    
    [self.contentView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(self);
    }];
    
    [self.contentView1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(self);
        make.size.mas_equalTo(self);
    }];
    
    [self.contentView1 addSubview:self.square1];
    [self.contentView1 addSubview:self.desc1];
    
    [self.square1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView1.mas_left).offset(5);
        make.top.mas_equalTo(self.contentView1.mas_top).offset(5);
        make.size.mas_equalTo(CGSizeMake(160, 160));
    }];
    [self.desc1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.square1.mas_left);
        make.bottom.mas_equalTo(self.contentView1.mas_bottom).offset(-20);
    }];
    
    [self.contentView2 addSubview:self.square2];
    [self.contentView2 addSubview:self.desc2];
    
    [self.square2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView2.mas_left).offset(5);
        make.top.mas_equalTo(self.contentView2.mas_top).offset(5);
        make.size.mas_equalTo(CGSizeMake(160, 160));
    }];
    [self.desc2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.square1.mas_left);
        make.bottom.mas_equalTo(self.contentView2.mas_bottom).offset(-20);
    }];
    
//    [self.contentView1 layoutIfNeeded];
//    [self.contentView2 layoutIfNeeded];
//    [self.square1 layoutIfNeeded];
//    [self.square2 layoutIfNeeded];
//    [self.desc1 layoutIfNeeded];
//    [self.desc2 layoutIfNeeded];
//    self.contentView1.alpha=1;
//    self.contentView2.alpha=0;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (ino64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.contentView2.transform=CGAffineTransformMakeScale(0.1, 0.1);
        self.contentView2.alpha=0.1;
        
        [self layoutIfNeeded];
        
//        [UIView animateWithDuration:3.0 animations:^{
//            self.contentView2.transform=CGAffineTransformMakeScale(0.2, 0.2);
//            self.contentView2.alpha=0.2;
//        } completion:^(BOOL finished) {
//
//        }];
    });
}

- (UIView *)contentView1 {
    if (_contentView1==nil) {
        _contentView1=[UIView new];
        _contentView1.clipsToBounds=YES;
        _contentView1.backgroundColor=[UIColor greenColor];
    }
    return _contentView1;
}

- (UIView *)square1 {
    if (_square1==nil) {
        _square1=[UIView new];
        _square1.clipsToBounds=YES;
        _square1.backgroundColor=[UIColor yellowColor];
    }
    return _square1;
}

- (UILabel *)desc1 {
    if (_desc1==nil) {
        _desc1=[UILabel new];
        _desc1.backgroundColor=[UIColor redColor];
        _desc1.textColor=[UIColor blackColor];
        _desc1.text=@"_desc1_desc1_desc1";
    }
    return _desc1;
}

- (UIView *)contentView2 {
    if (_contentView2==nil) {
        _contentView2=[UIView new];
        _contentView2.clipsToBounds=YES;
        _contentView2.backgroundColor=[UIColor blueColor];
    }
    return _contentView2;
}

- (UIView *)square2 {
    if (_square2==nil) {
        _square2=[UIView new];
        _square2.clipsToBounds=YES;
        _square2.backgroundColor=[UIColor grayColor];
    }
    return _square2;
}

- (UILabel *)desc2 {
    if (_desc2==nil) {
        _desc2=[UILabel new];
        _desc2.backgroundColor=[UIColor redColor];
        _desc2.textColor=[UIColor blackColor];
        _desc2.text=@"_desc2_desc2_desc2";
    }
    return _desc2;
}
@end

@interface TestCycleAnimationViewController ()
@property (nonatomic,strong) CardView *cardView;
@end

@implementation TestCycleAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configUI];
}

- (void)configUI {
    CGFloat s_width=[[UIScreen mainScreen]bounds].size.width;

    self.view.backgroundColor=[UIColor whiteColor];
    
    [self.view addSubview:self.cardView];
    
    [self.cardView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(10);
        make.top.mas_equalTo(self.view.mas_top).offset(100);
        make.width.mas_equalTo((s_width-20)/2.0);
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(-300);
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (ino64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.cardView startAnimation];
    });
    
}

- (UIView *)cardView {
    if (_cardView==nil) {
        _cardView=[CardView new];
        _cardView.clipsToBounds=YES;
        _cardView.backgroundColor=[UIColor clearColor];
    }
    return _cardView;
}
@end
