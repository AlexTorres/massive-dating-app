//
//  NSUserDefaults+Utils.m
//  ember
//
//  Created by John A Torres B on 11/05/14.
//  Copyright (c) 2014 ember. All rights reserved.
//

#import "NSUserDefaults+Utils.h"

@implementation NSUserDefaults (Utils)

static NSString *const kEncryptionKeyKeyChainKey = @"encryptionKey";

+ (NSString *)stringForKey:(NSString *)key
{
	return [[NSUserDefaults standardUserDefaults] stringForKey:key];
}

+ (id)objectForKey:(NSString *)key
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

+ (void)setObject:(id)value forKey:(NSString *)key
{
	[[NSUserDefaults standardUserDefaults] setObject:value forKey:key];
	[[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)decryptedStringForKey:(NSString *)key
{
    NSString *encryptionKey = [UICKeyChainStore stringForKey:kEncryptionKeyKeyChainKey];
	NSData *encryptedString = [[NSUserDefaults standardUserDefaults] objectForKey:key];
	return [EMMiscUtils decryptData:encryptedString withKey:encryptionKey];
}

+ (void)encryptAndSetString:(NSString *)string forKey:(NSString *)key
{
    NSString *encryptionKey = [UICKeyChainStore stringForKey:kEncryptionKeyKeyChainKey];
    if (!encryptionKey)
    {
        encryptionKey = [EMMiscUtils generateGUID];
        [UICKeyChainStore setString:encryptionKey forKey:kEncryptionKeyKeyChainKey];
    }
	NSData *encryptedString = [EMMiscUtils encryptString:string withKey:encryptionKey];
	[[NSUserDefaults standardUserDefaults] setObject:encryptedString forKey:key];
	[[NSUserDefaults standardUserDefaults] synchronize];
}

@end
