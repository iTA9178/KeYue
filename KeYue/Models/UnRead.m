//
//  UnRead.m
//  KeYue
//
//  Created by mingway on 11/30/15.
//  Copyright © 2015 KeYue Inc. All rights reserved.
//

#import "UnRead.h"

@implementation UnRead

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{ @"message"                   : @"message",
              @"result"                    : @"result",
              };
}

+ (NSValueTransformer *)messageJsonTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
        Message *message = [MTLJSONAdapter modelOfClass:[Message class] fromJSONDictionary:value error:nil];
        
        return message;
    }];
}

@end

@implementation Message

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{ @"follower"                   : @"follower",
              @"haveTopicsByUFollowings"    : @"haveTopicsByUFollowings",
              @"notice"                     : @"notice",
              @"spread"                     : @"spread",
              @"upTopicReply"               : @"upTopicReply",
              };
}

@end
