//
//  DALoginViewController.h
//  DocAppTest
//
//  Created by IntBitRavi on 4/25/16.
//  Copyright © 2016 Intbit. All rights reserved.
//

#import "DABaseViewController.h"

@interface DALoginViewController : DABaseViewController

@property (strong, nonatomic) IBOutlet UITextField *UsernameField;
@property (strong, nonatomic) IBOutlet UITextField *passwordField;

- (IBAction)signIn:(id)sender;
@end
