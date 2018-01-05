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
#import "AutolayoutViewController.h"
#import "TestLayoutAnimationViewController.h"

NSString *cellIdentifier = @"tableviewcell";

typedef NS_ENUM(NSUInteger, PureOCTestType) {
    PureOCTestTypeTestBindScrollViews = 0,
    PureOCTestTypeTestIP2Int,
    PureOCTestTypeTestHookList,
    PureOCTestTypeTestGetVC,
    PureOCTestTypeTestJKTest,
    PureOCTestTypeTestAutoLayout,
    PureOCTestTypeTestLayoutAnimation
};

@interface PureOCViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic,strong) NSArray *ds;
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation PureOCViewController

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.ds = @[@"testBindWebView", @"testIP2Int", @"testHookList", @"testGetVC", @"testJKTest", @"testAutoLayout", @"testLayoutAnimation"];
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
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
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
        case PureOCTestTypeTestAutoLayout:
            [self testAutoLayout];
            break;
        case PureOCTestTypeTestLayoutAnimation:
            [self testLayoutAnimation];
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
    UIViewController *vc = [[TestLayoutAnimationViewController alloc] init];
    
    [self.navigationController pushViewController:vc animated:YES];
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
    UIViewController *vc = [[AutolayoutViewController alloc] init];
    
    [self.navigationController pushViewController:vc animated:YES];
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
