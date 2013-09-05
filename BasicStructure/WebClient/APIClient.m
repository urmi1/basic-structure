//
//  AppDelegate.h
//  BasicStructure
//
//  Created by __CompanyName__ on 27/05/13.
//  Copyright (c) 2013 __CompanyName__. All rights reserved.
//

#import "APIClient.h"


#import "AFJSONRequestOperation.h"

static NSString * const kAPIBaseURLString = @"PathToWebservice";

#define kUserLogin @"PathOfLogin"
#define kList @"PathOfList"

@implementation APIClient

+ (instancetype)sharedClient {
    static APIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:kAPIBaseURLString]];
    });
    
    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    //[self setDefaultHeader:@"Accept" value:@"application/json"];
    
    return self;
}

- (void)getAccount:(NSDictionary *)params success:(void(^)(Login *account))success failure:(void (^)(NSError *))failure{
    [self genericGetAtPath:kUserLogin withParams:params :^(id JSON) {
        NSError *error = [self checkResult:JSON];
        if(!error){
            Login *account = [Login sharedInstance];
            [account initWithDictionary:JSON[@"result"][@"data"]];
            success(account);
        } else {
            failure(error);
        }
    } failure:^(NSError *error) {
        failure(error);
    }];
}

- (void)getList:(NSDictionary *)params success:(void(^)(NSMutableArray *contacts))success failure:(void (^)(NSError *error))failure{
    [self genericGetAtPath:kList withParams:params :^(id JSON) {
        NSError *error = [self checkResult:JSON];
        if(!error){
            NSArray *itemDictionaries = JSON[@"result"][@"data"];
            NSMutableArray *arrContacts = [NSMutableArray array];
            for (NSDictionary *dictionary in itemDictionaries) {
                [arrContacts addObject:[[List alloc] initWithDictionary:dictionary]];
            }
            success(arrContacts);
        } else {
            failure(error);
        }
    } failure:^(NSError *error) {
        failure(error);
    }];
}

#pragma mark internal API

- (void)genericGetAtPath:(NSString *)path withParams:(NSDictionary *)params :(void(^)(id JSON))onComplete failure:(void (^)(NSError *error))failure {
    [self postPath:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSError *error= nil;
        if (!responseObject) {
            onComplete(nil);
            return;
        }
        
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:&error];
        if (error) {
            NSLog(@"JSON parsing error in %@", NSStringFromSelector(_cmd));
            failure(error);
        } else {
            onComplete(json);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"request failed %@ (%li)", operation.request.URL, (long)operation.response.statusCode);
        failure(error);
    }];
}

-(NSError*)checkResult:(id)JSON{
    NSError *error = nil;
    NSDictionary *result = JSON[@"result"];
    if([[result valueForKey:@"success"] intValue]==0){
        NSMutableDictionary* details = [NSMutableDictionary dictionary];
        [details setValue:[result valueForKey:@"message"] forKey:NSLocalizedDescriptionKey];
        error = [NSError errorWithDomain:@"world" code:200 userInfo:details];
    }
    return error;
}

@end
