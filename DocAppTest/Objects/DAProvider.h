//
//  DAProvider.h
//  DocAppTest
//
//  Created by IntBitRavi on 4/25/16.
//  Copyright © 2016 Intbit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DAProvider : NSObject

@property (nonatomic, strong) NSString *Provider_id;
@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) NSString *prefix;
@property (nonatomic, strong) NSString *phoneNumber;
@property (nonatomic, strong) NSString *email;

@end
