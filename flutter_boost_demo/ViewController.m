//
//  ViewController.m
//  FlutterBoostDemo
//
//  Created by 三金 on 2019/12/10.
//  Copyright © 2019 三金. All rights reserved.
//

#import "ViewController.h"
#import <FlutterBoost.h>
#import "PlatformRouterImp.h"
#import <flutter_boost/FlutterBoost.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    PlatformRouterImp *router = [PlatformRouterImp new];
    router.navigationController = self.navigationController;
    [FlutterBoostPlugin.sharedInstance startFlutterWithPlatform:router
                                                        onStart:^(FlutterEngine *engine) {
                                                            
                                                        }];
    UIButton *pushBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [pushBtn setTitle:@"push flutter" forState:UIControlStateNormal];
    pushBtn.frame = CGRectMake(100, 100, 100, 30);
    [pushBtn addTarget:self action:@selector(pushFlutter) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushBtn];
}

- (void)pushFlutter {
    [FlutterBoostPlugin open:@"first"
                   urlParams:@{}
                        exts:@{@"animated":@(YES)}
              onPageFinished:^(NSDictionary *result) {}
                  completion:^(BOOL f) {}];
}


@end
