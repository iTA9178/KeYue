//
//  User.h
//  KeYue
//
//  Created by mingway on 11/27/15.
//  Copyright © 2015 KeYue Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (readwrite, nonatomic, strong) NSNumber *status;

/**
 *  register
 */
@property (readwrite, nonatomic, strong) NSString *phonenumber, *captcha, *nickname, *avatar;
@property (readwrite, nonatomic, strong) NSNumber *sexnumber;

/**
 *  resetuserinfo
 */

/**
 *  RHUser
 */
@property (nonatomic, copy) NSString *userID;
@property (nonatomic) NSInteger topicCount;
@property (nonatomic) NSInteger spreadCount;
@property (nonatomic, assign) NSInteger beSpreadedCount;
@property (nonatomic) NSInteger followersNum;
@property (nonatomic) NSInteger followingsNum;
@property (nonatomic) NSInteger scoreCount;
@property (nonatomic) NSInteger unreadCount;
@property (nonatomic) NSInteger gradeCount;
@property (nonatomic) NSInteger publishCountToday;
@property (nonatomic) BOOL canPublishToday;
@property (nonatomic, copy) NSString *registerDay;
@property (nonatomic, assign) bool login_via_QQ;
@property (nonatomic, assign) bool login_via_weibo;
@property (nonatomic, assign) bool login_via_wechat;
//@property (nonatomic, strong) RHUserProfile *profile;

@end
