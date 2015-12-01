//
//  UnReadManager.m
//  KeYue
//
//  Created by mingway on 11/26/15.
//  Copyright © 2015 KeYue Inc. All rights reserved.
//

#import "UnReadManager.h"
#import "KeYueNetAPIManager.h"
#import "UnRead.h"

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
    [[KeYueNetAPIManager sharedManager] requestUnReadCountSuccess:^(id returnData, int code, NSString *msg) {
        UnRead *unread = [MTLJSONAdapter modelOfClass:[UnRead class] fromJSONDictionary:returnData error:nil];
        
        [UIApplication sharedApplication].applicationIconBadgeNumber = unread.message.notice;
    } failure:^(NSError *error) {
        
    }];
}

@end
