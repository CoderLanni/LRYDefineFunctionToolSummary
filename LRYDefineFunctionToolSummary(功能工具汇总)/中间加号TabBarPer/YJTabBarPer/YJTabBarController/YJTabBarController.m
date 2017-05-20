//
//  YJTabBarController.m
//  YJTabBarPer
//
//  Created by houdage on 15/11/17.
//  Copyright © 2015年 YJHou. All rights reserved.
//

#import "YJTabBarController.h"
#import "UIImage+YJImage.h"
#import "YJTabBar.h"

#import "MainViewController.h"


@interface YJTabBarController () <YJTabBarDelegate>

@property (nonatomic, strong) NSMutableArray *items;

@end

@implementation YJTabBarController


- (NSMutableArray *)items{
    if (_items == nil) {
        
        _items = [NSMutableArray array];
    }
    return _items;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加所有子控制器
    [self setUpAllChildViewController];
    
    // 自定义tabBar
    [self setUpTabBar];
}
- (void)setUpTabBar{
    // 自定义tabBar
    YJTabBar *tabBar = [[YJTabBar alloc] initWithFrame:self.tabBar.frame];
    tabBar.backgroundColor = [UIColor whiteColor];
    tabBar.delegate = self;
    tabBar.items = self.items;
    [self.view addSubview:tabBar];
    // 移除系统的tabBar
    [self.tabBar removeFromSuperview];
}

// *************************  此处添加所有的子控制器start  ***********************
#warning  -- 1.此处添加所有的子控制器
- (void)setUpAllChildViewController{
    // 1
    UIViewController *home = [[UIViewController alloc] init];
    home.view.backgroundColor = [UIColor redColor];
//    home.tabBarItem.badgeValue = @"2";
    [self setUpOneChildViewController:home image:[UIImage imageNamed:@"tabbar_home"] selectedImage:[UIImage imageWithOriginalName:@"tabbar_home_selected"] title:@"首页"];
    
    
    // 2
    UIViewController *message = [[UIViewController alloc] init];
    message.view.backgroundColor = [UIColor orangeColor];
    message.tabBarItem.badgeValue = @"3";
    [self setUpOneChildViewController:message image:[UIImage imageNamed:@"tabbar_message_center"] selectedImage:[UIImage imageWithOriginalName:@"tabbar_message_center_selected"] title:@"邮件"];
    
    // 3
    UIViewController *discover = [[UIViewController alloc] init];
    discover.view.backgroundColor = [UIColor grayColor];
    [self setUpOneChildViewController:discover image:[UIImage imageNamed:@"tabbar_discover"] selectedImage:[UIImage imageWithOriginalName:@"tabbar_discover_selected"] title:@"发现"];
    
    // 4
    UIViewController *profile = [[UIViewController alloc] init];
    profile.view.backgroundColor = [UIColor greenColor];
    [self setUpOneChildViewController:profile image:[UIImage imageNamed:@"tabbar_profile"] selectedImage:[UIImage imageWithOriginalName:@"tabbar_profile_selected"] title:@"我"];
}

//     2. 点击加号按钮的时候调用
- (void)tabBarDidClickPlusButton:(YJTabBar *)tabBar{
    MainViewController * mainView = [[MainViewController alloc] init];
    [self presentViewController:mainView animated:YES completion:nil];
    NSLog(@"模态");
}
// *************************  此处添加所有的子控制器end  ***********************

#pragma mark - 当点击tabBar上的按钮调用
- (void)tabBar:(YJTabBar *)tabBar didClickButton:(NSInteger)index{
    if (index == 0 && self.selectedIndex == index) {
        
    }
    self.selectedIndex = index;
}


- (void)setUpOneChildViewController:(UIViewController *)vc image:(UIImage *)image selectedImage:(UIImage *)selectedImage title:(NSString *)title{
    vc.title = title;
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selectedImage;
    
    // 保存tabBarItem模型到数组
    [self.items addObject:vc.tabBarItem];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    
    [self addChildViewController:nav];
}

@end
