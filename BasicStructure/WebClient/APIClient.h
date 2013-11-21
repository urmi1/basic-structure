//
//  AppDelegate.h
//  BasicStructure
//
//  Created by __CompanyName__ on 27/05/13.
//  Copyright (c) 2013 __CompanyName__. All rights reserved.
//

#import "AFHTTPClient.h"
#import "APIKit.h"

@interface APIClient : AFHTTPClient

//Callback typedef
typedef void(^APIClientCallback)(NSError *error, NSDictionary *dictionary);

+ (APIClient *)sharedClient;

//Login details
- (void)getAccount:(NSDictionary *)params callBack:(APIClientCallback)callBack;

//Get listing
- (void)getList:(NSDictionary *)params callBack:(APIClientCallback)callBack;

@end
