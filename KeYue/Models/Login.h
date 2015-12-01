//
//  Login.h
//  KeYue
//
//  Created by mingway on 11/27/15.
//  Copyright © 2015 KeYue Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Login : NSObject

+ (BOOL)isLogin;
+ (void)doLogin:(NSDictionary *)loginData;
+ (void)doLogout;

- (User *)currentLoginUser;

@end
