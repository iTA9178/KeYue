//
//  KeYueNetAPIManager.h
//  KeYue
//
//  Created by mingway on 11/26/15.
//  Copyright © 2015 KeYue Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeYueNetAPIManager : NSObject

+ (instancetype)sharedManager;

- (void)requstHintTextWithBlock:(void (^)(id data, NSError *error))block;

- (void)request_UnReadCountWithBlock:(void (^)(id data, NSError *error))block;

@end
