//
//  DATableViewCell.h
//  DocAppTest
//
//  Created by IntBitRavi on 4/25/16.
//  Copyright © 2016 Intbit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DATableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *practiceName;
@property (strong, nonatomic) IBOutlet UILabel *providerName;
@property (strong, nonatomic) IBOutlet UILabel *appointments;

@end
