//
//  DAProviderViewController.m
//  DocAppTest
//
//  Created by IntBitRavi on 4/25/16.
//  Copyright © 2016 Intbit. All rights reserved.
//

#import "DAProviderViewController.h"
#import "DAAppConstants.h"
#import "DataManager.h"
#import "DAAppConstants.h"
#import "DATableViewCell.h"



@interface DAProviderViewController ()

@end

@implementation DAProviderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[DataManager getInstance] getDataFromURL:kAllProviders parameter:nil onSuccess:^(NSData *data) {
        NSDictionary *userResponse =[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSMutableArray *userResponseArray = [[userResponse objectForKey:@"d"]objectForKey:@"providers"];
        NSLog(@"%@",userResponseArray);
        NSMutableArray *array = [[NSMutableArray alloc]init];
        for (int index = 0; index< [userResponseArray count]; index++) {
            NSString *providerNames = [[userResponseArray objectAtIndex:index]objectForKey:@"fullName"];
            [array addObject:providerNames];
        }
        NSLog(@"%@", array);
        self.dataArray = array;
        NSLog(@"%@",self.dataArray);
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
    return self.dataArray.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DATableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"default" forIndexPath:indexPath];
    cell.practiceName.text = [self.dataArray objectAtIndex:indexPath.row];
    return cell;
}



@end
