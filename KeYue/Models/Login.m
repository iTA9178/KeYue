//
//  Login.m
//  KeYue
//
//  Created by mingway on 11/27/15.
//  Copyright © 2015 KeYue Inc. All rights reserved.
//

#import "Login.h"

static User *currentLoginUser;

@implementation Login

- (instancetype)init {
    self = [super init];
    if (self) {
//        self.phonenumber = @"";
//        self.captcha = @"";
//        self.nickname = @"";
//        self.avatar = @"";
//        self.sexnumber = [NSNumber numberWithInteger:0];
    }
    return self;
}

+ (BOOL)isLogin {
    return NO;
}

+ (void)doLogin:(NSDictionary *)loginData {

}

+ (void)doLogout {

}

- (User *)currentLoginUser {
    User *user;
    
    return user;
}

@end
