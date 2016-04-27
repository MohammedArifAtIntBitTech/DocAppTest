//
//  DataManager.h
//  DocAppTest
//
//  Created by IntBitRavi on 4/25/16.
//  Copyright © 2016 Intbit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataManager : NSObject<NSURLSessionDelegate>

@property (nonatomic, strong) NSDictionary *BASE_URL;

+ (DataManager *)getInstance;

- (NSString *)getURL:(NSString *)ObjectKey;

- (void)getDataFromURL:(NSString *)baseUrl parameter:(NSDictionary *)dictParameter  onSuccess:(void(^)(NSData *data))_onSuccess onError:(void(^)(NSError *error))_onError;

- (void)getAcessToken:(NSString *)baseUrl onSuccess:(void(^)(NSData *data))_onSuccess onError:(void(^)(NSError *error))_onError;

@end