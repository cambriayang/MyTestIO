//
//  TestIAPVC.h
//  MyTestIO
//
//  Created by yeyang on 2018/11/2.
//  Copyright © 2018 CambriaYang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <StoreKit/StoreKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TestIAPVC : UIViewController <SKPaymentTransactionObserver, SKProductsRequestDelegate>

@end

NS_ASSUME_NONNULL_END
