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

@end
