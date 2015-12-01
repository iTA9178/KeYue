//
//  UnRead.h
//  KeYue
//
//  Created by mingway on 11/30/15.
//  Copyright © 2015 KeYue Inc. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface Message : MTLModel<MTLJSONSerializing>

//message =     {
//    follower = 0;
//    haveTopicsByUFollowings = 0;
//    notice = 0;
//    spread = 0;
//    upTopicReply = 0;
//};
//result = 1;

@property (nonatomic, assign) BOOL follower;
@property (nonatomic, assign) BOOL haveTopicsByUFollowings;
@property (nonatomic, assign) NSInteger notice;
@property (nonatomic, assign) NSInteger spread;
@property (nonatomic, assign) BOOL upTopicReply;

@end

@interface UnRead : MTLModel<MTLJSONSerializing>

@property (nonatomic, strong) Message *message;
@property (nonatomic, assign) NSInteger result;

@end
