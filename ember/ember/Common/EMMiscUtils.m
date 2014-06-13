//
//  MTMiscUtils.m
//  ember
//
//  Created by John A Torres B on 5/06/14.
//  Copyright (c) 2014 ember. All rights reserved.
//

#import "EMMiscUtils.h"
#import "EMLocalDataManager.h"
#import "EMCountryModel.h"
#include <sys/sysctl.h>
#import <objc/runtime.h>
#import <objc/message.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>

@implementation EMMiscUtils

+ (NSString *)getSysInfoByName:(char *)typeSpecifier
{
	size_t size;
	sysctlbyname(typeSpecifier, NULL, &size, NULL, 0);
    
	char *answer = malloc(size);
	sysctlbyname(typeSpecifier, answer, &size, NULL, 0);
    
	NSString *results = [NSString stringWithCString:answer encoding:NSUTF8StringEncoding];
    
	free(answer);
	return results;
}

#pragma mark - Public Methods

+ (NSString *)generateGUID
{
	NSMutableString *guid = [[NSMutableString alloc] initWithCapacity:kGUIDLength];
	for (NSUInteger i = 0; i < kGUIDLength; i++)
	{
		NSInteger maxNumber = [kGUIDAlphabet length];
		NSUInteger randNum = arc4random() % maxNumber;
		[guid appendFormat:@"%c", [kGUIDAlphabet characterAtIndex:randNum]];
	}
    
	return guid;
}

+ (NSData *)encryptString:(NSString *)plainText withKey:(NSString *)key
{
	return [[plainText dataUsingEncoding:NSUTF8StringEncoding] AES256EncryptWithKey:key];
}

+ (NSString *)decryptData:(NSData *)cipherText withKey:(NSString *)key
{
	return [[NSString alloc] initWithData:[cipherText AES256DecryptWithKey:key] encoding:NSUTF8StringEncoding];
}

+ (NSString *)platform
{
	return [self getSysInfoByName:"hw.machine"];
}
+ (NSArray *) countryList
{
    if([EMLocalDataManager sharedInstance].countryList) {
        return [EMLocalDataManager sharedInstance].countryList;
    } else {
        
        NSMutableArray *countries = [NSMutableArray arrayWithCapacity: [[NSLocale ISOCountryCodes] count]];
        for (NSString *countryCode in [NSLocale ISOCountryCodes])
        {
            NSString *identifier = [NSLocale localeIdentifierFromComponents: [NSDictionary dictionaryWithObject: countryCode forKey: NSLocaleCountryCode]];
            NSString *country = [[NSLocale currentLocale] displayNameForKey: NSLocaleIdentifier value: identifier];
            EMCountryModel *countryModel = [EMCountryModel new];
            countryModel.countryCode = countryCode;
            countryModel.countryName = country;
            [countries addObject: countryModel];
        }
        //[EMLocalDataManager sharedInstance].countryList = countries;
        return countries;
    }
    
}

+ (NSDictionary *) countryListFromPlist {
    
    if([EMLocalDataManager sharedInstance].countryPlist) {
        return [EMLocalDataManager sharedInstance].countryPlist;
    } else {
        NSString *path = [[NSBundle mainBundle] pathForResource:
                          @"Countries" ofType:@"plist"];
        
        NSDictionary *plist = [NSDictionary dictionaryWithContentsOfFile:path];
        if (!plist) {
            
            [plist writeToFile:path atomically:YES];
        }
       // [EMLocalDataManager sharedInstance].countryPlist = plist;
        return  plist;
    }

}
+ (NSString *)getActualConutry
{
    CTTelephonyNetworkInfo *info = [CTTelephonyNetworkInfo new];
    CTCarrier *carrier = info.subscriberCellularProvider;
    return carrier.mobileCountryCode;
}


@end
