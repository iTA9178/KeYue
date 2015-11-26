//
//  WechatViewController.m
//  KeYue
//
//  Created by mingway on 11/26/15.
//  Copyright © 2015 KeYue Inc. All rights reserved.
//

#import "WechatViewController.h"
#import "KeYueNetAPIManager.h"

@implementation WechatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self requestData];
}

- (void)requestData {
    [[KeYueNetAPIManager sharedManager] requstHintTextWithBlock:^(id data, NSError *error) {
        NSLog(@"========data=%@==========",data);
    }];
}

@end
