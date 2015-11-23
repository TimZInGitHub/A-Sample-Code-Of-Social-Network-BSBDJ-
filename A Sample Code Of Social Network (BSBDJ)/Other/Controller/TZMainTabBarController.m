//
//  TZMainTabBarController.m
//  A Sample Code Of Social Network (BSBDJ)
//
//  Created by Tim.Z on 11/23/15.
//  Copyright © 2015 Tim.Z. All rights reserved.
//

#import "TZMainTabBarController.h"

#import "TZNavigationController.h"
#import "TZEssenceViewController.h"
#import "TZNewViewController.h"
#import "TZFollowViewController.h"
#import "TZMeViewController.h"
#import "TZLoginRegisterViewController.h"

#import "TZTabBar.h"


/**
 *  TabBarController界面切换枚举
 */
typedef NS_ENUM(NSUInteger, TZTabBarIndex) {

    TZTabBarIndexEssence = 0,

    TZTabBarIndexNew = 1,

    TZTabBarIndexFollow = 2,

    TZTabBarIndexMe = 3
};

@interface TZMainTabBarController () <UITabBarControllerDelegate>

@property (nonatomic, getter=isLoggedIn) BOOL loggedIn;
@property (nonatomic, strong) TZTabBar *tzTzbBar;


@end

@implementation TZMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupTabBar];
    [self setUpItemTitleAttributes];
    [self setUpChildViewController];
#warning change
    self.loggedIn = NO;
    
    [self setSelectedIndex:0];
    
//    self.delegate = self;
    
//    [self presentLoinRegisterVC];
    
//    [self delegateSignal];
}

#pragma mark - setup

/**
 *  用KVC 将原生的tabBar用自定义的tabBar将其替换
 */
- (void)setupTabBar
{
    [self setValue:[[TZTabBar alloc] init] forKey:@"tabBar"];
    self.tzTzbBar = self.tabBar;
}

/**
 *  利用 "appearance" 统一配置tabBarItem的文字属性
 */
- (void)setUpItemTitleAttributes
{
    UITabBarItem *item = [UITabBarItem appearance];
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    [item setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor redColor];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}


/**
 *  根据应用要求 自定义导航控制器
    然后 初始化 不同板块的导航控制器 , 再配置导航控制器各自的根控制器为内容控制器
    配置每一个自控制器的tabBarItem(image,selectedImage,title)
    配置好各个导航控制器后addChildViewController
 */
- (void)setUpChildViewController
{
    TZEssenceViewController *essenceVC = [[TZEssenceViewController alloc] init];
    TZNavigationController *essenceNC = [[TZNavigationController alloc] initWithRootViewController:essenceVC];
    essenceNC.tabBarItem.tzTitle(@"Essence").tzImage([UIImage imageNamed:@"tabBar_essence_icon"]).tzSelectedImage([UIImage imageNamed:@"tabBar_essence_click_icon"]);
    [self addChildViewController:essenceNC];
    
    TZNewViewController *newVC = [[TZNewViewController alloc] init];
    TZNavigationController *newNC = [[TZNavigationController alloc] initWithRootViewController:newVC];
    newNC.tabBarItem.tzTitle(@"New").tzImage([UIImage imageNamed:@"tabBar_new_icon"]).tzSelectedImage([UIImage imageNamed:@"tabBar_new_click_icon"]);
    [self addChildViewController:newNC];
    
    TZFollowViewController *FollowVC = [[TZFollowViewController alloc] init];
    TZNavigationController *followNC = [[TZNavigationController alloc] initWithRootViewController:FollowVC];
    followNC.tabBarItem.tzTitle(@"Follow").tzImage([UIImage imageNamed:@"tabBar_friendTrends_icon"]).tzSelectedImage([UIImage imageNamed:@"tabBar_friendTrends_click_icon"]);
    [self addChildViewController:followNC];
    
    TZMeViewController *meVC = [[TZMeViewController alloc] init];
    TZNavigationController *meNC = [[TZNavigationController alloc] initWithRootViewController:meVC];
    meNC.tabBarItem.tzTitle(@"Me").tzImage([UIImage imageNamed:@"tabBar_me_icon"]).tzSelectedImage([UIImage imageNamed:@"tabBar_me_click_icon"]);
    [self addChildViewController:meNC];
}



/**
 *  貌似只在初始化的时候调用这个方法,有待探究!!!
 */
//- (void)setSelectedIndex:(NSUInteger)selectedIndex
//{
//    TZFUNC
//    [super setSelectedIndex:selectedIndex];
//}

    //- (void)presentLoinRegisterVC
    //{
    //    if (self.isLoggedIn == NO) {
    //        TZFUNC
    //        [RACObserve(self, selectedIndex) subscribeNext:^(id x) {
    //            TZLog(@"index%d", self.selectedIndex);
    //            TZLog(@"x%@", x);
    //            if (x == TZTabBarIndexFollow) {
    //                TZLoginRegisterViewController *loginRVC = [[TZLoginRegisterViewController alloc] init];
    //                loginRVC.view.backgroundColor = TZCommonBackgroundColor;
    //
    //                [self presentViewController:loginRVC animated:YES completion:nil];
    //
    //                x = TZTabBarIndexEssence;
    //
    //                TZFUNC
    //            }
    //        }];
    //    }
    //
    //}

    //- (void)presentLoinRegisterVC
    //{
    //    TZLog(@"%lu", (unsigned long)self.selectedIndex);
    //    [[self rac_valuesAndChangesForKeyPath:@"selectedIndex" options:NSKeyValueObservingOptionNew observer:nil] subscribeNext:^(id x) {
    //        TZLog(@"%lu", (unsigned long)self.selectedIndex);
    //    }];
    //}

    //- (void)presentLoinRegisterVC
    //{
    //    [[self rac_signalForSelector:@selector(setSelectedIndex:)] subscribeNext:^(id x) {
    //        TZLog(@"%ld", self.selectedIndex);
    //    }];
    //}

- (void)setSelectedViewController:(__kindof UIViewController *)selectedViewController
{
    if (selectedViewController == self.viewControllers[TZTabBarIndexFollow]) {
        TZLoginRegisterViewController *loginRVC = [[TZLoginRegisterViewController alloc] init];
        loginRVC.view.backgroundColor = TZCommonBackgroundColor;
        [self presentViewController:loginRVC animated:YES completion:nil];
        
//        selectedViewController = self.viewControllers[TZTabBarIndexEssence];//没用!
//        [self setSelectedViewController:self.viewControllers[TZTabBarIndexEssence]];//没用!
        loginRVC.delegateSignal = [RACSubject subject];
        [loginRVC.delegateSignal subscribeNext:^(id x) {
            [self setSelectedViewController:self.viewControllers[TZTabBarIndexEssence]];
        }] ;
    }
    
    [super setSelectedViewController:selectedViewController];
    
}

//#pragma mark - <UITabBarControllerDelegate>
///**
// *  记得要设置代理!!!!!!
// */
//- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
//{
//    if (self.isLoggedIn == NO) {
//        if ([viewController.childViewControllers[0] isKindOfClass:[TZFollowViewController class]]) {
//            TZFUNC
//            
//        }
//    }
//}

//- (void)delegateSignal
//{
//    self.tzTzbBar.delegateSignal = [RACSubject subject];
//    [self.tzTzbBar.delegateSignal subscribeNext:^(UITabBarItem * x) {
//        if (x.title == @"Follow") {
//            
//            TZLoginRegisterViewController *loginRVC = [[TZLoginRegisterViewController alloc] init];
//            loginRVC.view.backgroundColor = TZCommonBackgroundColor;
//            [self presentViewController:loginRVC animated:YES completion:nil];
////            [self.tzTzbBar setSelectedItem:self.tzTzbBar.items[1]];
//            [self setSelectedIndex:0];
//        }
//    }];
//}


@end
