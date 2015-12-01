//
//  KeYueNetAPIManager.h
//  KeYue
//
//  Created by mingway on 11/26/15.
//  Copyright © 2015 KeYue Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^KYSuccessBlock)(id returnData, int code, NSString *msg);
typedef void(^KYFailureBlock)(NSError *error);

@interface KeYueNetAPIManager : NSObject

+ (instancetype)sharedManager;

- (void)startMonitoring;

- (void)requstHintTextWithBlock:(void (^)(id data, NSError *error))block;

- (void)requstHintTextSuccess:(KYSuccessBlock)success failure:(KYFailureBlock)failure;

- (void)requestUnReadCountWithBlock:(void (^)(id data, NSError *error))block;

- (void)requestUnReadCountSuccess:(KYSuccessBlock)success failure:(KYFailureBlock)failure;

@end
