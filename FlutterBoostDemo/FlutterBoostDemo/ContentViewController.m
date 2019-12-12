//
//  ContentViewController.m
//  FlutterBoostDemo
//
//  Created by 三金 on 2019/12/11.
//  Copyright © 2019 三金. All rights reserved.
//

#import "ContentViewController.h"
#import <FlutterBoost.h>

@interface ContentViewController ()

@end

@implementation ContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
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
