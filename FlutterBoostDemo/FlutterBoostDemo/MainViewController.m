//
//  MainViewController.m
//  FlutterBoostDemo
//
//  Created by 三金 on 2019/12/11.
//  Copyright © 2019 三金. All rights reserved.
//

#import "MainViewController.h"
#import <FlutterBoost.h>
#import "PlatformRouterImp.h"
#import "ContentViewController.h"

@interface MainViewController () <UITabBarControllerDelegate>

@property (nonatomic, strong) PlatformRouterImp *router;

@end

@implementation MainViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:[ContentViewController new]];
        nav1.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"nav1" image:nil tag:0];
        UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:[ContentViewController new]];
        nav2.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"nav2" image:nil tag:1];
        UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:[ContentViewController new]];
        nav3.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"nav3" image:nil tag:2];
        UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:[ContentViewController new]];
        nav4.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"nav4" image:nil tag:3];
        
        self.viewControllers = @[nav1, nav2, nav3, nav4];
        self.delegate = self;
        self.router.navigationController = nav1;
        [FlutterBoostPlugin.sharedInstance startFlutterWithPlatform:self.router
                                                            onStart:^(FlutterEngine *engine) {
                                                                
                                                            }];
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    self.router.navigationController = (UINavigationController *)viewController;
    return YES;
}

- (PlatformRouterImp *)router
{
    if (!_router) {
        _router = [PlatformRouterImp new];
    }
    return _router;
}

@end
