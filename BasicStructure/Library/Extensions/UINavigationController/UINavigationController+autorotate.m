//
//  UINavigationController+autorotate.m
//  YouShop
//
//  Created by Jennis on 17/12/12.
//  Copyright (c) 2012 Jennis. All rights reserved.
//

#import "UINavigationController+autorotate.h"

@implementation UINavigationController (autorotate)

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskPortraitUpsideDown;
}

@end