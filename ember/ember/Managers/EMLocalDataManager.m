//
//  EMLocalDataManager.m
//  ember
//
//  Created by John A Torres B on 5/06/14.
//  Copyright (c) 2014 ember. All rights reserved.
//

#import "EMLocalDataManager.h"
static NSString *const kUserPhone = @"EMUserPhone";
static NSString *const kUserToken = @"EMUserToken";
static NSString *const kUserPassword = @"EMUserPassword";

@implementation EMLocalDataManager

+ (instancetype)sharedInstance
{
    static dispatch_once_t once;
    static EMLocalDataManager *sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[EMLocalDataManager alloc] initLocalDataManager];
    });
    return sharedInstance;
}

- (id)init
{
    @throw [NSException singletonExceptionWithClass:[self class]];
}

#pragma mark - Private methods

- (id)initLocalDataManager
{
    self = [super init];
    if (self)
    {
        
    }
    return self;
}

- (NSString *)userPhone
{
    NSString *userPhone = [NSUserDefaults decryptedStringForKey:kUserPhone];
    return [userPhone isEmpty] ? nil : userPhone;
}

- (void)setUserPhone:(NSString *)userPhone
{
    [NSUserDefaults encryptAndSetString:userPhone forKey:kUserPhone];
}

- (NSString *)userToken
{
    NSString *userToken = [NSUserDefaults decryptedStringForKey:kUserToken];
    return [userToken isEmpty] ? nil : userToken;
}

- (void)setUserToken:(NSString *)userToken
{
    [NSUserDefaults encryptAndSetString:userToken forKey:kUserToken];
}
- (NSString *)userPassword
{
    NSString *userPassword = [NSUserDefaults decryptedStringForKey:kUserPassword];
    return [userPassword isEmpty] ? nil : userPassword;
}

- (void)setUserPassword:(NSString *)GUID
{
    [NSUserDefaults encryptAndSetString:GUID forKey:kUserPassword];
}
@end
