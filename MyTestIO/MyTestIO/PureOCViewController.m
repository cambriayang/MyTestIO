//
//  PureOCViewController.m
//  ASDKTestOn4S
//
//  Created by yeyang on 2017/3/22.
//  Copyright © 2017年 CambriaYang. All rights reserved.
//

#import "PureOCViewController.h"
#import "LFXHookGuard.h"
#import "JKTest.h"
#import "AutolayoutViewController.h"
#import "TestLayoutAnimationViewController.h"
#import <FLEX/FLEX.h>
#import "TestBindScrollViewVC.h"
#import "TestGetVC.h"

NSString *cellIdentifier = @"tableviewcell";

typedef NS_ENUM(NSUInteger, PureOCTestType) {
    PureOCTestTypeShowFlex = 0,
    PureOCTestTypeTestBindScrollViews,
    PureOCTestTypeTestIP2Int,
    PureOCTestTypeTestHookList,
    PureOCTestTypeTestGetVC,
    PureOCTestTypeTestJKTest,
    PureOCTestTypeTestAutoLayout,
    PureOCTestTypeTestLayoutAnimation,
    PureOCTestTypeTestWKWebView
};

@interface PureOCViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic,strong) NSArray *ds;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,assign) PureOCTestType type;
@end

@implementation PureOCViewController

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.ds = @[@"showFlex", @"TestBindScrollViewVC", @"testIP2Int", @"testHookList", @"TestGetVC", @"testJKTest", @"AutolayoutViewController", @"TestLayoutAnimationViewController", @"TestWKWebViewVC"];
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
    
    self.type = indexPath.row;
    
    switch (self.type) {
        case PureOCTestTypeTestJKTest:
            [self testJKTest];
            break;
        case PureOCTestTypeTestHookList:
            [self testHookList];
            break;
        case PureOCTestTypeTestIP2Int:
            [self testIP2Int];
            break;
        case PureOCTestTypeShowFlex:
        {
            [[FLEXManager sharedManager] toggleExplorer];
        }
            break;
        case PureOCTestTypeTestBindScrollViews:
        case PureOCTestTypeTestGetVC:
        case PureOCTestTypeTestAutoLayout:
        case PureOCTestTypeTestLayoutAnimation:
            [self gotoTestVC];
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

- (void)gotoTestVC {
    NSString *name = self.ds[self.type];
    
    Class cls = NSClassFromString(name);
    
    UIViewController *vc = [[cls alloc] init];
    
    if (vc != nil) {
        [self.navigationController pushViewController:vc animated:YES];
    }
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

@end
