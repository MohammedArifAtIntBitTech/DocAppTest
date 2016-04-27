//
//  DALoginViewController.m
//  DocAppTest
//
//  Created by IntBitRavi on 4/25/16.
//  Copyright © 2016 Intbit. All rights reserved.
//

#import "DALoginViewController.h"
#import "DAPracticeViewController.h"


@interface DALoginViewController ()

@end

@implementation DALoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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

#pragma mark - Action

- (IBAction)signIn:(id)sender {
    if([self.UsernameField.text  isEqualToString:@"Practice1"] && [self.passwordField.text isEqualToString:@"Password1"]){
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Practice" bundle:nil];
        UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"practice"];
        [self.navigationController showViewController:vc sender:nil];
        
    }else if([self.UsernameField.text  isEqualToString:@"Provider1"] && [self.passwordField.text isEqualToString:@"Password1"]){
        UIStoryboard *storyboard1 = [UIStoryboard storyboardWithName:@"Provider" bundle:nil];
        UIViewController *wc = [storyboard1 instantiateViewControllerWithIdentifier:@"provider"];
        [self.navigationController showViewController:wc sender:nil];
        
        
    }else if([self.UsernameField.text  isEqualToString:@"Patient1"] && [self.passwordField.text isEqualToString:@"Password1"]){
        UIStoryboard *storyboard2 = [UIStoryboard storyboardWithName:@"Patient" bundle:nil];
        UIViewController *qc = [storyboard2 instantiateViewControllerWithIdentifier:@"appointment"];
        [self.navigationController showViewController:qc sender:nil];
        
    }else{
        UIAlertController * alert=   [UIAlertController alertControllerWithTitle:@"Username or Password is incorrect. Please Try Again" message:nil preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"OK", @"OK action") style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        }];
        
        [alert addAction:okAction];
        [self presentViewController:alert animated:YES completion:nil];
        self.UsernameField.text =@"";
        self.passwordField.text = @"";
    }
    self.UsernameField.text =@"";
    self.passwordField.text = @"";
    
}

@end
