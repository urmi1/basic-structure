//
//  ViewController.m
//  BasicStructure
//
//  Created by __CompanyName__ on 27/05/13.
//  Copyright (c) 2013 __CompanyName__. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(void)sampleAPIClientCall{
//    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:@"value",@"key",@"morevalue" ,@"morekey",nil];
//    [[APIClient sharedClient] getAccount:params success:^(Login *account) {
//        [Helper hideLoadingView:self.view viewController:self];
//    } failure:^(NSError *error) {
//        [Helper showAlertView:@"Failed" withMessage:[error localizedDescription] delegate:nil];
//        [Helper hideLoadingView:self.view viewController:self];
//    }];
//}

@end
