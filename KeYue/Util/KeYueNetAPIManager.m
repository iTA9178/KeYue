//
//  KeYueNetAPIManager.m
//  KeYue
//
//  Created by mingway on 11/26/15.
//  Copyright © 2015 KeYue Inc. All rights reserved.
//

#import "KeYueNetAPIManager.h"
#import "KeYueNetAPIClient.h"

@implementation KeYueNetAPIManager

+ (instancetype)sharedManager {
    static dispatch_once_t pred;
    static KeYueNetAPIManager *_shareManager = nil;
    dispatch_once(&pred, ^{
        _shareManager = [[self alloc] init];
    });
    
    return _shareManager;
}

- (void)requstHintTextWithBlock:(void (^)(id data, NSError *error))block {
    [[KeYueNetAPIClient sharedJsonClient] requestJsonDataWithPath:@"system/publish/hint" withParams:nil withMethodType:Get andBlock:^(id data, NSError *error) {
        if (data) {
            block(data, nil);
        } else {
            block(nil, error);
        }
    }];
}

- (void)request_UnReadCountWithBlock:(void (^)(id data, NSError *error))block {
    [[KeYueNetAPIClient sharedJsonClient] requestJsonDataWithPath:@"api/user/unread-count" withParams:nil withMethodType:Get autoShowError:NO andBlock:^(id data, NSError *error) {
        if (data) {
//            [MobClick event:kUmeng_Event_Request_Notification label:@"Tab首页的红点通知"];
            
            id resultData = [data valueForKeyPath:@"data"];
            block(resultData, nil);
        }else{
            block(nil, error);
        }
    }];
}

@end
