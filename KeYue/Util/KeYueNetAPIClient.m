//
//  KeYueNetAPIClient.m
//  KeYue
//
//  Created by mingway on 11/12/15.
//  Copyright © 2015 KeYue Inc. All rights reserved.
//

#import "KeYueNetAPIClient.h"
#import "NSObject+Common.h"

//#ifdef DEBUG
//#define HOST_SERVER @"http://121.42.143.55:8080/1.6"//ALiCloud
//#else
//#define HOST_SERVER @"http://api.rehu.cn/1.6"// UCloud
//#endif

@implementation KeYueNetAPIClient

+ (KeYueNetAPIClient *)sharedJsonClient {
    static dispatch_once_t onceToken;
    static KeYueNetAPIClient *_sharedClient = nil;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[KeYueNetAPIClient alloc] initWithBaseURL:[NSURL URLWithString:[NSObject baseURLStr]]];
    });
    
    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    self.responseSerializer = [AFJSONResponseSerializer serializer];
    self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"text/javascript", @"text/json", @"text/html", nil];
    
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:[self currentLanguage] forHTTPHeaderField:@"Accept-Language"];
    [self.requestSerializer setTimeoutInterval:30];
    
    self.securityPolicy.allowInvalidCertificates = YES;
    
    NSString *token = [self getUserToken];
    if (token) {
        [self.requestSerializer setValue:[NSString stringWithFormat:@"bearer %@", token] forHTTPHeaderField:@"Authorization"];
    }
    
    return self;
}

- (void)requestJsonDataWithPath:(NSString *)aPath
                     withParams:(NSDictionary*)params
                 withMethodType:(NetworkMethod)method
                       andBlock:(void (^)(id data, NSError *error))block{
    [self requestJsonDataWithPath:aPath withParams:params withMethodType:method autoShowError:YES andBlock:block];
}

- (void)requestJsonDataWithPath:(NSString *)aPath
                     withParams:(NSDictionary*)params
                 withMethodType:(NetworkMethod)method
                  autoShowError:(BOOL)autoShowError
                       andBlock:(void (^)(id data, NSError *error))block{
    if (!aPath || aPath.length <= 0) {
        return;
    }
    //log请求数据
//    DebugLog(@"\n===========request===========\n%@\n%@:\n%@", kNetworkMethodName[method], aPath, params);
    aPath = [aPath stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    //    发起请求
    switch (method) {
        case Get:{
            //所有 Get 请求，增加缓存机制
            NSMutableString *localPath = [aPath mutableCopy];
            if (params) {
                [localPath appendString:params.description];
            }
            [self GET:aPath parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
//                DebugLog(@"\n===========response===========\n%@:\n%@", aPath, responseObject);
//                id error = [self handleResponse:responseObject autoShowError:autoShowError];
//                if (error) {
//                    responseObject = [NSObject loadResponseWithPath:localPath];
//                    block(responseObject, error);
//                }else{
//             qqm;tq       if ([responseObject isKindOfClass:[NSDictionary class]]) {
//                        [NSObject saveResponseData:responseObject toPath:localPath];
//                    }
//                    block(responseObject, nil);
//                }
            } failure:^(NSURLSessionDataTask *task, NSError *error) {
//                DebugLog(@"\n===========response===========\n%@:\n%@", aPath, error);
//                !autoShowError || [self showError:error];
//                id responseObject = [NSObject loadResponseWithPath:localPath];
//                block(responseObject, error);
            }];
            break;}
        case Post:{
            [self POST:aPath parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
//                DebugLog(@"\n===========response===========\n%@:\n%@", aPath, responseObject);
//                id error = [self handleResponse:responseObject autoShowError:autoShowError];
//                if (error) {
//                    block(nil, error);
//                }else{
//                    block(responseObject, nil);
//                }
            } failure:^(NSURLSessionDataTask *task, NSError *error) {
//                DebugLog(@"\n===========response===========\n%@:\n%@", aPath, error);
//                !autoShowError || [self showError:error];
                block(nil, error);
            }];
            break;}
        case Put:{
            [self PUT:aPath parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
//                DebugLog(@"\n===========response===========\n%@:\n%@", aPath, responseObject);
//                id error = [self handleResponse:responseObject autoShowError:autoShowError];
//                if (error) {
//                    block(nil, error);
//                }else{
//                    block(responseObject, nil);
//                }
            } failure:^(NSURLSessionDataTask *task, NSError *error) {
//                DebugLog(@"\n===========response===========\n%@:\n%@", aPath, error);
//                !autoShowError || [self showError:error];
                block(nil, error);
            }];
            break;}
        case Delete:{
            [self DELETE:aPath parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
//                DebugLog(@"\n===========response===========\n%@:\n%@", aPath, responseObject);
//                id error = [self handleResponse:responseObject autoShowError:autoShowError];
//                if (error) {
//                    block(nil, error);
//                }else{
//                    block(responseObject, nil);
//                }
            } failure:^(NSURLSessionDataTask *task, NSError *error) {
//                DebugLog(@"\n===========response===========\n%@:\n%@", aPath, error);
//                !autoShowError || [self showError:error];
//                block(nil, error);
            }];}
        default:
            break;
    }
    
}

#pragma mark - Helper

- (NSString *)currentLanguage {
    NSString *language = [[[NSBundle mainBundle] preferredLocalizations] firstObject];
    
    if ([language hasPrefix:@"en"]) {
        language = @"en-us";
    } else if ([language hasPrefix:@"zh"]) {
        language = @"zh-cn";
    }
    return language;
}

- (NSString *)getUserToken {
    NSString *token = [[NSUserDefaults standardUserDefaults] stringForKey:@"userToken"];
    return token;
}

//#pragma mark NetError
//
//-(id)handleResponse:(id)responseJSON{
//    return [self handleResponse:responseJSON autoShowError:YES];
//}
//
//-(id)handleResponse:(id)responseJSON autoShowError:(BOOL)autoShowError{
//    NSError *error = nil;
//    //code为非0值时，表示有错
//    NSNumber *resultCode = [responseJSON valueForKeyPath:@"code"];
//    
//    if (resultCode.intValue != 0) {
//        error = [NSError errorWithDomain:[NSObject baseURLStr] code:resultCode.intValue userInfo:responseJSON];
//        
//        if (resultCode.intValue == 1000 || resultCode.intValue == 3207) {//用户未登录
//            if ([Login isLogin]) {//已登录的状态要抹掉
//                [Login doLogout];
//                [((AppDelegate *)[UIApplication sharedApplication].delegate) setupLoginViewController];
//                kTipAlert(@"%@", [self tipFromError:error]);
//            }
//        }else{
//            if (autoShowError) {
//                [self showError:error];
//            }
//        }
//    }
//    return error;
//}

@end
