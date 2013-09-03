//
//  AppDelegate.h
//  BasicStructure
//
//  Created by __CompanyName__ on 27/05/13.
//  Copyright (c) 2013 __CompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoadingView.h"
#import "MainViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

//Main windows
@property (strong, nonatomic) UIWindow *window;

//Navigation controller
@property (strong, nonatomic) UINavigationController *navController;

//Main controller
@property (strong, nonatomic) MainViewController *viewController;

//Loading
@property (strong, nonatomic) LoadingView *loadingView;

@end
