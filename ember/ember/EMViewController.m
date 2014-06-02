//
//  EMViewController.m
//  ember
//
//  Created by John A Torres B on 10/05/14.
//  Copyright (c) 2014 ember. All rights reserved.
//

#import "EMViewController.h"
#import "EMLoginManager.h"

@interface EMViewController ()

@end

@implementation EMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    EMLoginManager * loginManager = [EMLoginManager sharedInstance];
    
    NSString * dummy = [loginManager codeForPhone:@"573005548744"
                                     withPassword:@"gatovolador"];
    NSLog(@"%@",dummy);
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
