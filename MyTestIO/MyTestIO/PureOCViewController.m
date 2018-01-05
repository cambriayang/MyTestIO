//
//  PureOCViewController.m
//  ASDKTestOn4S
//
//  Created by yeyang on 2017/3/22.
//  Copyright © 2017年 CambriaYang. All rights reserved.
//

#import "PureOCViewController.h"
#import "JRSwizzle.h"
#import "NSMutableArray+SafeAdd.h"
#import <UIKit/UIActivityViewController.h>
#import "MyTestBindScrollView.h"
#import "LFXHookGuard.h"
#import "JKTest.h"

NSString *cellIdentifier = @"tableviewcell";

typedef NS_ENUM(NSUInteger, PureOCTestType) {
    PureOCTestTypeTestBindScrollViews = 0,
    PureOCTestTypeTestIP2Int,
    PureOCTestTypeTestHookList,
    PureOCTestTypeTestGetVC,
    PureOCTestTypeTestJKTest
};

@interface PureOCViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic,strong) NSArray *ds;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIView *blueBlock;
@property (nonatomic, strong) MASConstraint *labelTopOffset;
@property (nonatomic, strong) MASConstraint *blueBlockTopOffset;
@property (nonatomic, strong) MASConstraint *blueBlockLeftOffset;
@end

@implementation PureOCViewController

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.ds = @[@"TestBindWebView", @"TestIP2Int", @"TestHookList", @"TestGetVC", @"TestJKTest"];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
//    [self testLayoutAnimation];
//    [self testAutoLayout];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
    self.tableView.separatorColor = [UIColor redColor];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.ds.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = self.ds[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case PureOCTestTypeTestBindScrollViews:
            [self testBindScrollViews];
            break;
        case PureOCTestTypeTestIP2Int:
            [self testIP2Int];
            break;
        case PureOCTestTypeTestHookList:
            [self testHookList];
            break;
        case PureOCTestTypeTestGetVC:
            [self testGetVC];
            break;
        case PureOCTestTypeTestJKTest:
            [self testJKTest];
            break;
        default:
            break;
    }
}

- (void)testJKTest {
    JKTest *test = [JKTest new];
    
    @try {
        [test setValue:@"KVC" forKey:@"_objjj"];
        [test valueForKey:@"_objjj"];
    } @catch (NSException *exception) {
        NSLog(@"==[%@]==", exception.description);
    } @finally {
        NSLog(@"==[%@]==", test.object);
    }
}

- (void)testHookList {
    [LFXHookGuard swapMethodsOfMutableArray];
    NSLog(@"******%s",  __FUNCTION__);
}

- (void)testIP2Int {
    [self testIP2Int:@"172.168.5.1"];
    [self testIP2Int:@"17 2.168.5.1"];
    [self testIP2Int:@" 172 .168.5.1"];
    [self testIP2Int:@"172. 168.5. 1"];
}

- (void)testBindScrollViews {
    UIViewController *vc = [UIViewController new];
    
    vc.view.backgroundColor = [UIColor whiteColor];
    
    MyTestBindScrollView *view = [MyTestBindScrollView new];
    
    [vc.view addSubview:view];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(vc.view);
    }];
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)testLayoutAnimation {
    UILabel *label = [UILabel new];
    
    label.text = @"Test";
    label.textColor = [UIColor redColor];
    
    [self.view addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        self.labelTopOffset = make.top.equalTo(self.view.mas_top).offset(160);
        make.centerX.equalTo(self.view.mas_centerX);
    }];
    
    self.label = label;
    
    UIView *blueBlock = [UIView new];
    
    [self.view addSubview:blueBlock];
    
    blueBlock.backgroundColor = [UIColor blueColor];
    
    [blueBlock mas_makeConstraints:^(MASConstraintMaker *make) {
        self.blueBlockTopOffset = make.top.equalTo(label.mas_bottom).offset(10);
        self.blueBlockLeftOffset = make.left.equalTo(label.mas_left);
        make.size.mas_equalTo(CGSizeMake(100, 60));
    }];
    
    self.blueBlock = blueBlock;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setTitle:@"Click" forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).offset(-20);
        make.size.mas_equalTo(CGSizeMake(100, 50));
        make.centerX.equalTo(self.view.mas_centerX);
    }];
}

- (void)clicked:(UIButton *)btn {
    [UIView animateWithDuration:2.0 animations:^{
//        [self.label mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.view.mas_top).offset(260);
//            make.centerX.equalTo(self.view.mas_centerX);
//        }];
        self.labelTopOffset.offset = 260;
        self.label.alpha = 0.5;
        
//        [self.blueBlock mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.label.mas_bottom).offset(20);
//            make.left.equalTo(self.label.mas_left).offset(50);
//            make.size.mas_equalTo(CGSizeMake(100, 60));
//        }];
        self.blueBlockTopOffset.offset = 20;
        self.blueBlockLeftOffset.offset = 50;
        self.label.alpha = 0.7;
        
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        NSLog(@"Done");
    }];
}

- (void)testIP2Int:(NSString *)ipv4 {
    NSString *src = ipv4;
    
    //iterate to have the four segment recorded
    NSArray *list = [src componentsSeparatedByString:@"."];
    
    if (list.count != 4) {
        NSLog(@"==[Your Input is not IPv4 fromat!!!]==");
        
        return;
    } else {
        long long sum = 0;
        
        for (int i = 0; i < list.count; i++) {
            NSString *tmp = [list[i] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];

            //one or more spaces will be wrong.
            if ([tmp containsString:@" "]) {
                NSLog(@"==[Your ip segment has one or more spaces]==");
                break;
            }
            
            sum += [tmp integerValue] * pow(256, 3 - i);
        }
        
        if (sum > 0)
            NSLog(@"%lld", sum);
    }
}

- (void)testGetVC {
    CGFloat viewWidth = CGRectGetWidth(self.view.frame);
    CGFloat viewHeight = CGRectGetHeight(self.view.frame);
    
    self.title = NSStringFromClass([self class]);
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake((viewWidth - 50)/2.0, (viewHeight - 50)/2.0, 50, 50)];
    
    view.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:view];
    
    UIView *anotherView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    
    anotherView.backgroundColor = [UIColor blueColor];
    
    [view addSubview:anotherView];
    
    NSLog(@"%@", [[self getViewControllerOfView:anotherView] description]);
}

- (void)testAutoLayout {
    UILabel *l1 = [[UILabel alloc] init];
    
    l1.text = @"nihaoooooooooooo";
    l1.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:l1];
    
    UILabel *l2 = [[UILabel alloc] init];
    
    l2.text = @"ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss";
    l2.backgroundColor = [UIColor yellowColor];
    l2.preferredMaxLayoutWidth = 100;
    l2.lineBreakMode = NSLineBreakByTruncatingTail;
    l2.numberOfLines = 3;
    
    [self.view addSubview:l2];
    
    UILabel *l3 = [[UILabel alloc] init];
    
    l3.text = @"tttttttttttttttttttttttttt";
    l3.backgroundColor = [UIColor purpleColor];
    
    [self.view addSubview:l3];
    
    [l3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.mas_right).offset(-15.0);
        make.top.equalTo(self.view.mas_top).offset(150.0);
    }];
    
    [l1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(15.0);
        make.top.equalTo(self.view.mas_top).offset(100.0);
    }];
    
    [l2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(l1.mas_right).offset(5.0);
        make.right.equalTo(l3.mas_left).offset(-10.0);
        make.top.equalTo(self.view.mas_top).offset(100.0);
    }];
}

/**
 Get the View 's father ViewController as long as the view is in the Viewcontroller's hierarchy
 
 @param view targetView
 @return father ViewController
 */
- (UIViewController *)getViewControllerOfView:(UIView *)view {
    if ([view superview] == nil) {
        UIResponder *nextResponder = [view nextResponder];
        return  (UIViewController *)nextResponder;
    }
    
    for (UIView* next = [view superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    
    return nil;
}

@end
