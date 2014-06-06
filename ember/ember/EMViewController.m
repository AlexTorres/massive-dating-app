//
//  EMViewController.m
//  ember
//
//  Created by John A Torres B on 10/05/14.
//  Copyright (c) 2014 ember. All rights reserved.
//

#import "EMViewController.h"
#import "EMLoginManager.h"
#import "EMLocalDataManager.h"
#import "ember-Bridging-Header.h"
#import "ember-Swift.h"




@interface EMViewController ()

@end

@implementation EMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    

   
    
	// Do any additional setup after loading the view, typically from a nib.
}
- (void)viewDidAppear:(BOOL)animated {
    if ([EMLocalDataManager sharedInstance].userPassword && [EMLocalDataManager sharedInstance].userToken)
    {
        
    } else {
        [self performSegueWithIdentifier:@"gotoLogin" sender:self];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
