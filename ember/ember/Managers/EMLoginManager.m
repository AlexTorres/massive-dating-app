//
//  EMLoginManager.m
//  ember
//
//  Created by John A Torres B on 10/05/14.
//  Copyright (c) 2014 ember. All rights reserved.
//

#import "EMLoginManager.h"

@implementation EMLoginManager

+ (instancetype)sharedInstance
{
	static dispatch_once_t once;
	static EMLoginManager *sharedInstance;
	dispatch_once(&once, ^{
	    sharedInstance = [[EMLoginManager alloc] initLoginManager];
	});
	return sharedInstance;
}

- (id)init
{
	@throw [NSException singletonExceptionWithClass:[self class]];
}

- (NSString*)getCodeForPhoneNumber
{
    return @"";
}
- (void)signWithMSISDN:(NSString *)MSISDN
             andDeviceNumber:(NSString *)pincode
{

}

#pragma mark - Private methods

- (id)initLoginManager
{
	self = [super init];
	if (self)
	{

	}
	return self;
}


@end
