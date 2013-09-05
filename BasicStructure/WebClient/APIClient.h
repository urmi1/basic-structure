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

+ (APIClient *)sharedClient;

- (void)getAccount:(NSDictionary *)params success:(void(^)(Login *account))success failure:(void (^)(NSError *error))failure;
- (void)getList:(NSDictionary *)params success:(void(^)(NSMutableArray *contacts))success failure:(void (^)(NSError *error))failure;

@end
