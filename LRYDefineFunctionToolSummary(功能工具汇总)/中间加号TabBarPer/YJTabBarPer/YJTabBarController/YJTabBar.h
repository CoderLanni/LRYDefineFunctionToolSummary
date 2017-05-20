//
//  YJTabBar.h
//  YJTabBarPer
//
//  Created by houdage on 15/11/17.
//  Copyright © 2015年 YJHou. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YJTabBar;

@protocol YJTabBarDelegate <NSObject>

@optional
- (void)tabBar:(YJTabBar *)tabBar didClickButton:(NSInteger)index;
/**
 *  点击加号按钮的时候调用
 */
- (void)tabBarDidClickPlusButton:(YJTabBar *)tabBar;

@end

@interface YJTabBar : UIView

// items:保存每一个按钮对应tabBarItem模型
@property (nonatomic, strong) NSArray * items;

@property (nonatomic, weak) id<YJTabBarDelegate> delegate;

@end
