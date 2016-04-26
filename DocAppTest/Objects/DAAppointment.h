//
//  DAAppointment.h
//  DocAppTest
//
//  Created by IntBitRavi on 4/25/16.
//  Copyright © 2016 Intbit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DAAppointment : NSObject

@property (nonatomic, strong) NSString *end_date;
@property (nonatomic, strong) NSString *start_date;
@property (nonatomic, strong) NSString *patient_id;
@property (nonatomic, strong) NSString *practice_location_id;
@property (nonatomic, strong) NSString *provider_id;
@property (nonatomic, strong) NSString *sort_order;
@property (nonatomic, strong) NSString *status;

@end
