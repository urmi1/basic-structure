//
//  UINavigationController+autorotate.m
//  YouShop
//
//  Created by Jennis on 17/12/12.
//  Copyright (c) 2012 Jennis. All rights reserved.
//

#import "UIViewController+Orientation.h"

@implementation UIViewController (Orientation)

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait || interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown);
}

-(NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskPortraitUpsideDown;
}


@end