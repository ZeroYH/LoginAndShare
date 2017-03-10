//
//  AppDelegate.m
//  三方登陆&分享
//
//  Created by df on 2017/2/15.
//  Copyright © 2017年 df. All rights reserved.
//

#import "AppDelegate.h"
#import <TencentOpenAPI/TencentOAuth.h>
#import "ThirdTool.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [[ThirdTool sharedManager] registQQWithAppId:@"1105909993" andAppKey:@"7CaXuvhrYSwAgiEO"];

    [[ThirdTool sharedManager] registWXWithAppId:@"wx8d4e96c8ef765646"];

    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    
    return [TencentOAuth HandleOpenURL:url] || [WXApi handleOpenURL:url delegate:[ThirdTool sharedManager]];
    
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url{
        
    return [TencentOAuth HandleOpenURL:url] || [WXApi handleOpenURL:url delegate:[ThirdTool sharedManager]];

}

#ifdef NSFoundationVersionNumber_iOS_8_x_Max

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    
    return [TencentOAuth HandleOpenURL:url] || [WXApi handleOpenURL:url delegate:[ThirdTool sharedManager]];

}

#endif

@end
