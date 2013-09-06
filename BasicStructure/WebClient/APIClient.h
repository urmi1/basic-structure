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
typedef void(^APIClientCallback)(NSError *error, id result, ...);

+ (APIClient *)sharedClient;

//Login details
- (void)getAccount:(NSDictionary *)params callBack:(APIClientCallback)callBack;
- (void)getAccount:(NSDictionary *)params success:(void(^)(Login *account))success failure:(void (^)(NSError *error))failure;

// Any listing
- (void)getList:(NSDictionary *)params success:(void(^)(NSMutableArray *list))success failure:(void (^)(NSError *error))failure;

@end
