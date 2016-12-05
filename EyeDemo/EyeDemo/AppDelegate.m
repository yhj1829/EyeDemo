//
//  AppDelegate.m
//  EyeDemo
//
//  Created by 阳光 on 16/12/3.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import "AppDelegate.h"
#import "ShopListVC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    _window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _window.rootViewController=[[UINavigationController alloc]initWithRootViewController:[ShopListVC new]];
    _window.backgroundColor=[UIColor whiteColor];
    [_window makeKeyAndVisible];
    
    return YES;
}


@end
