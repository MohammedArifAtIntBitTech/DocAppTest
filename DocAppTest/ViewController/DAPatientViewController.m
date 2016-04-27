//
//  DAPatientViewController.m
//  DocAppTest
//
//  Created by IntBitRavi on 4/25/16.
//  Copyright © 2016 Intbit. All rights reserved.
//

#import "DAPatientViewController.h"
#import "DAAppConstants.h"
#import "DataManager.h"
#import "DAProvider.h"
#import "DATableViewCell.h"


@interface DAPatientViewController ()

@end

@implementation DAPatientViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[DataManager getInstance] getDataFromURL:kAllProviders parameter:nil onSuccess:^(NSData *data) {
        NSDictionary *userResponse =[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSMutableArray *userResponseArray = [[userResponse objectForKey:@"d"]objectForKey:@"providers"];
        userArray = [[NSMutableArray alloc] init];
        for (int index = 0; index< [userResponseArray count]; index++) {
            DAProvider *user = [[DAProvider alloc] init];
            user.firstName =[[userResponseArray objectAtIndex:index] objectForKey:@"firstName"];
            [userArray addObject:user];
        }
        [self setDataArray:[userArray copy]];
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
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

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.filteredData) {
        return [self.filteredData count];
    }
    return [self.dataArray count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DATableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"default" forIndexPath:indexPath];
    DAProvider *user = self.filteredData?self.filteredData[indexPath.row]:self.dataArray[indexPath.row];
    cell.patientName.text = [NSString stringWithFormat:@"%@",user.firstName];
    return cell;
}


@end
