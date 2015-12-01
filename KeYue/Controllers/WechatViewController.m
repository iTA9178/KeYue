//
//  WechatViewController.m
//  KeYue
//
//  Created by mingway on 11/26/15.
//  Copyright © 2015 KeYue Inc. All rights reserved.
//

#import "WechatViewController.h"
#import "KeYueNetAPIManager.h"
#import "UnRead.h"

@implementation WechatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self requestData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self requestData];
}

- (void)requestData {
//    [[KeYueNetAPIManager sharedManager] requstHintTextWithBlock:^(id data, NSError *error) {
//        NSLog(@"========data=%@==========",data);
//    }];
    
//    [[KeYueNetAPIManager sharedManager] requstHintTextSuccess:^(id returnData, int code, NSString *msg) {
//        DebugLog(@"===data=%@==code=%d==msg=%@", returnData, code, msg);
//    } failure:^(NSError *error) {
//        
//    }];
    
    [[KeYueNetAPIManager sharedManager] requestUnReadCountSuccess:^(id returnData, int code, NSString *msg) {
//        DebugLog(@"%@",returnData);
        UnRead *unread = [MTLJSONAdapter modelOfClass:[UnRead class] fromJSONDictionary:returnData error:nil];
        DebugLog(@"============================%@===================", (BOOL)unread.message.follower);
    } failure:^(NSError *error) {
        DebugLog(@"%@",error.localizedDescription);
    }];
}

@end
