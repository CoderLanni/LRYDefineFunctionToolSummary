//
//  AppDelegate.m
//  3DTouchMyDemo
//
//  Created by ZE KANG on 2017/5/15.
//  Copyright © 2017年 LRY. All rights reserved.
//



/**
 
 在 info.plist 中添加以下字段(3DTouch 的链接动作)
 
 - (void)application:(UIApplication *)application
 performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem
 completionHandler:(void(^)(BOOL succeeded))completionHandler{
 //判断先前我们设置的唯一标识
 if([shortcutItem.type isEqualToString:@"UITouchText.share"]){
 NSArray *arr = @[@"hello 3D Touch"];
 UIActivityViewController *vc = [[UIActivityViewController alloc]initWithActivityItems:arr applicationActivities:nil];
 //设置当前的VC 为rootVC
 [self.window.rootViewController presentViewController:vc animated:YES completion:^{
 }];
 }
 else if ([shortcutItem.type isEqualToString:@"UITouchText.search"])
 {
 UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"好想你" delegate:nil cancelButtonTitle:@"cancle" otherButtonTitles:@"sure", nil];
 [alertView show];
 }
 else if ([shortcutItem.type isEqualToString:@"UITouchText.look"])
 {
 UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:@"温馨提示" delegate:nil cancelButtonTitle:@"cancle" destructiveButtonTitle:@"删除" otherButtonTitles:@"更多", nil];
 [sheet showInView:self.window];
 }
 else if ([shortcutItem.type isEqualToString:@"UITouchText.compose"])
 {
 NSLog(@"UITouchText.compose");
 }
 }
 

 
 
 
 */



#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    
    
    //自定义相关(或以上的plist 方式二选一)
    //    if (launchOptions) {
    //        UIApplication *app = [UIApplication sharedApplication];
    //        //获取一个应用程序对象的shortcutItem列表
    //        id existingShortcutItems = [app shortcutItems];
    //
    //        //获取第0个shortcutItem
    //        id oldItem = [existingShortcutItems objectAtIndex: 0];
    //        //将旧的shortcutItem改变为可修改类型shortcutItem
    //        id mutableItem = [oldItem mutableCopy];
    //        //修改shortcutItem的显示标题
    //        [mutableItem setLocalizedTitle: @"Click Lewis"];
    //        [mutableItem setIcon:[UIApplicationShortcutIcon iconWithTemplateImageName:@""]];
    //        [mutableItem setUserInfo:nil];
    //
    //        //根据旧的shortcutItems生成可变shortcutItems数组
    //        id updatedShortcutItems = [existingShortcutItems mutableCopy];
    //        //修改可变shortcutItems数组中对应index下的元素为新的shortcutItem
    //        [updatedShortcutItems replaceObjectAtIndex: 0 withObject: mutableItem];
    //        //修改应用程序对象的shortcutItems为新的数组
    //        [app setShortcutItems: updatedShortcutItems];
    //    
    //        return false;
    //    }

    
    
    [UIApplication sharedApplication].applicationIconBadgeNumber=0;

    
    return YES;
}


- (void)application:(UIApplication *)application
performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem
  completionHandler:(void(^)(BOOL succeeded))completionHandler{
    //判断先前我们设置的唯一标识
    if([shortcutItem.type isEqualToString:@"UITouchText.share"]){
        NSArray *arr = @[@"hello 3D Touch"];
        UIActivityViewController *vc = [[UIActivityViewController alloc]initWithActivityItems:arr applicationActivities:nil];
        //设置当前的VC 为rootVC
        [self.window.rootViewController presentViewController:vc animated:YES completion:^{
        }];
    }
    else if ([shortcutItem.type isEqualToString:@"UITouchText.search"])
    {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"好想你" delegate:nil cancelButtonTitle:@"cancle" otherButtonTitles:@"sure", nil];
        [alertView show];
    }
    else if ([shortcutItem.type isEqualToString:@"UITouchText.look"])
    {
        UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:@"温馨提示" delegate:nil cancelButtonTitle:@"cancle" destructiveButtonTitle:@"删除" otherButtonTitles:@"更多", nil];
        [sheet showInView:self.window];
    }
    else if ([shortcutItem.type isEqualToString:@"UITouchText.compose"])
    {
        NSLog(@"UITouchText.compose");
    }
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
