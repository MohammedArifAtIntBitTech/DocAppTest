//
//  DAPatient.h
//  DocAppTest
//
//  Created by IntBitRavi on 4/25/16.
//  Copyright © 2016 Intbit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DAPatient : NSObject

@property (nonatomic, strong) NSString *patient_id;
@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) NSString *prefix;
@property (nonatomic, strong) NSString *phoneNumber;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *dob;
@property (nonatomic, strong) NSString *notes;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, strong) NSString *updatedAt;

@end