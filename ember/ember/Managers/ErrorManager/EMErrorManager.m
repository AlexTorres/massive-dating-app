//
//  OCErrorManager.m
//  GithubMonitor
//
//  Created by John A Torres B on 28/05/14.
//  Copyright (c) 2014 Globant. All rights reserved.
//

#import "EMErrorManager.h"

@implementation EMErrorManager
+ (instancetype)sharedInstance
{
	static dispatch_once_t once;
	static EMErrorManager *sharedInstance;
	dispatch_once(&once, ^{
	    sharedInstance = [[EMErrorManager alloc] initErrorManager];
	});
	return sharedInstance;
}

- (void)handleError:(NSError *)error withMessage:(NSString*)message
{
    if([error.userInfo objectForKey:@"NSLocalizedDescription"]) {
        [self handleErrorMessage:[error.userInfo objectForKey:@"NSLocalizedDescription"]];
        
    } else {
        [self handleErrorMessage:message];
    }
}

- (id)init
{
	@throw [NSException singletonExceptionWithClass:[self class]];
}
- (id)initErrorManager
{
	self = [super init];
	if (self)
	{
        
	}
	return self;
}
- (void)handleErrorMessage:(NSString*)message
{
    if (message)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning"
                                                        message:message
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
}

@end
