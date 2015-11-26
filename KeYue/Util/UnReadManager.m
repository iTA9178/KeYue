//
//  UnReadManager.m
//  KeYue
//
//  Created by mingway on 11/26/15.
//  Copyright © 2015 KeYue Inc. All rights reserved.
//

#import "UnReadManager.h"
#import "KeYueNetAPIManager.h"

@implementation UnReadManager

+ (instancetype)sharedManager {
    static dispatch_once_t pred;
    static UnReadManager *_sharedManager = nil;
    dispatch_once(&pred, ^{
        _sharedManager = [[self alloc] init];
    });
    
    return _sharedManager;
}

- (void)updateUnRead {
    [[KeYueNetAPIManager sharedManager] request_UnReadCountWithBlock:^(id data, NSError *error) {
        if (data && [data isKindOfClass:[NSDictionary class]]) {
//            NSDictionary *dataDict = (NSDictionary *)data;
//            self.messages = [dataDict objectForKey:kUnReadKey_messages];
//            self.notifications = [dataDict objectForKey:kUnReadKey_notifications];
//            self.project_update_count = [dataDict objectForKey:kUnReadKey_project_update_count];
//            //更新应用角标
//            NSInteger unreadCount = self.messages.integerValue
//            +self.notifications.integerValue;
//            [UIApplication sharedApplication].applicationIconBadgeNumber = unreadCount;
        }
    }];
}

@end
