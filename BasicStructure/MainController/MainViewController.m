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

-(void)addImageCall{
    [Helper displayLoadingView:self.view viewController:self andMessage:kPleaseWait];
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInteger:0],@"user_id",nil];
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[kWebserviceURL toURL]];
    NSMutableURLRequest * request = [httpClient multipartFormRequestWithMethod:@"POST" path:@""  parameters:params constructingBodyWithBlock: ^(id <AFMultipartFormData>formData){
        [formData appendPartWithFileData:UIImagePNGRepresentation([UIImage imageNamed:@""]) name:@"name" fileName:@"filename" mimeType:@"image/png"];
    }];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [httpClient registerHTTPOperationClass:[AFHTTPRequestOperation class]];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject){
        NSData *data = (NSData *)responseObject;
        NSDictionary* jsonResponse = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        NSLog(@"jsonresponse %@",jsonResponse);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error){
        [Helper showAlertView:@"Failed" withMessage:[error localizedDescription] delegate:nil];
        [Helper hideLoadingView:self.view viewController:self];
    }];
    [operation start];
}

@end
