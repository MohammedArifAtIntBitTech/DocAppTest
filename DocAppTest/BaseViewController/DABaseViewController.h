//
//  DABaseViewController.h
//  DocAppTest
//
//  Created by IntBitRavi on 4/25/16.
//  Copyright © 2016 Intbit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DABaseViewController : UIViewController

@property (strong, nonatomic) NSMutableArray *dataArray;

- (IBAction)back:(id)sender;

- (IBAction)logout:(id)sender;

- (IBAction)dismiss:(id)sender;

@end