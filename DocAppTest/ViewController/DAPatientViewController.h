//
//  DAPatientViewController.h
//  DocAppTest
//
//  Created by IntBitRavi on 4/25/16.
//  Copyright © 2016 Intbit. All rights reserved.
//

#import "DABaseTableViewController.h"

@interface DAPatientViewController : DABaseTableViewController
{
    NSMutableArray *userArray;
    
}
@property (strong, nonatomic) NSMutableArray *filteredData;

@end
