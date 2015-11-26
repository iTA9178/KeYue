//
//  KeYueNetAPIClient.h
//  KeYue
//
//  Created by mingway on 11/12/15.
//  Copyright © 2015 KeYue Inc. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import <AFNetworking.h>

typedef NS_ENUM(NSUInteger, NetworkMethod) {
    Get = 0,
    Post,
    Put,
    Delete,
};

@interface KeYueNetAPIClient : AFHTTPSessionManager

+ (KeYueNetAPIClient *)sharedJsonClient;

- (void)requestJsonDataWithPath:(NSString *)aPath
                     withParams:(NSDictionary*)params
                 withMethodType:(NetworkMethod)method
                       andBlock:(void (^)(id data, NSError *error))block;

- (void)requestJsonDataWithPath:(NSString *)aPath
                     withParams:(NSDictionary*)params
                 withMethodType:(NetworkMethod)method
                  autoShowError:(BOOL)autoShowError
                       andBlock:(void (^)(id data, NSError *error))block;

- (void)requestJsonDataWithPath:(NSString *)aPath
                           file:(NSDictionary *)file
                     withParams:(NSDictionary*)params
                 withMethodType:(NetworkMethod)method
                       andBlock:(void (^)(id data, NSError *error))block;

@end
