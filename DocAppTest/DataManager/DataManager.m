//
//  DataManager.m
//  DocAppTest
//
//  Created by IntBitRavi on 4/25/16.
//  Copyright © 2016 Intbit. All rights reserved.
//

#import "DataManager.h"
#import "DAAppConstants.h"
#import "AppDelegate.h"


@implementation DataManager

+ (DataManager *)getInstance {
    
    static dispatch_once_t once;
    static id shareManager;
    dispatch_once(&once, ^{
        shareManager = [[self alloc] init];
        
    });
    return shareManager;
}

-(id)init {
    self = [super init];
    if (self) {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"NetworkPList" ofType:@"plist"];
        
        self.BASE_URL = [[NSDictionary alloc] initWithContentsOfFile:filePath];
    }
    return self;
}

-(NSString *)getURL:(NSString *)ObjectKey {
    
    NSMutableString *BASE_URL = [NSMutableString stringWithString:[self.BASE_URL objectForKey:kBaseUrl]];
    
    NSString *objectURL =[self.BASE_URL objectForKey:ObjectKey];
    
    if (objectURL) {
        [BASE_URL appendString:objectURL];
    }
    return BASE_URL;
}

- (void)getAcessToken:(NSString *)baseUrl onSuccess:(void(^)(NSData *data))_onSuccess onError:(void(^)(NSError *error))_onError  {
    
    NSURLSessionConfiguration *configurationSession = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:configurationSession delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    NSMutableString *mainUrl = [[NSMutableString alloc] initWithString:baseUrl];
    
    NSMutableURLRequest *requestUrl = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:mainUrl]];
    
    [requestUrl setValue:@"Basic aW50Yml0YXBwOmludGJpdHRlY2gyMDE1" forHTTPHeaderField:@"Authorization"];
    
    NSURLSessionDataTask *dataTask = [defaultSession dataTaskWithRequest:requestUrl completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
        if (!error) {
            if (_onSuccess != nil) {
                _onSuccess(data);
            }
            else {
                if (_onError != nil) {
                    _onError(error);
                }
            }
        }
    }];
    [dataTask resume];
}

-(void)getDataFromURL:(NSString *)baseUrl parameter:(NSDictionary *)dictParameter  onSuccess:(void(^)(NSData *data))_onSuccess onError:(void(^)(NSError *error))_onError {
    
    NSString *urlString = [[DataManager getInstance] getURL:baseUrl];
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    NSURLSessionConfiguration *configurationSession = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:configurationSession delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    NSMutableString *mainUrl = [[NSMutableString alloc] initWithString:urlString];
    
    NSMutableURLRequest *requestUrl = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:mainUrl]];
    
    [requestUrl setValue:appDelegate.accessToken forHTTPHeaderField:@"Authorization"];
    
    NSURLSessionDataTask *dataTask = [defaultSession dataTaskWithRequest:requestUrl completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
        if (!error) {
            if (_onSuccess != nil) {
                _onSuccess(data);
            }
            else {
                if (_onError != nil) {
                    _onError(error);
                }
            }
        }
    }];
    [dataTask resume];
}
@end
