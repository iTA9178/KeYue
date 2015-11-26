//
//  UnReadManager.h
//  KeYue
//
//  Created by mingway on 11/26/15.
//  Copyright © 2015 KeYue Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UnReadManager : NSObject

+ (instancetype)sharedManager;

- (void)updateUnRead;

@end
