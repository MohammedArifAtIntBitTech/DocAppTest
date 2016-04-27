//
//  DAAppointmentViewController.m
//  DocAppTest
//
//  Created by IntBitRavi on 4/25/16.
//  Copyright © 2016 Intbit. All rights reserved.
//

#import "DAAppointmentViewController.h"
#import "DAAppConstants.h"
#import "DataManager.h"


@interface DAAppointmentViewController ()

@end

@implementation DAAppointmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[DataManager getInstance] getDataFromURL:kAllAppointment parameter:nil onSuccess:^(NSData *data) {
        NSLog(@"%@",data);
        NSString* dataString;
        dataString = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
        NSLog(@"data is : %@", dataString);
    } onError:^(NSError *error) {
        
    }];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
