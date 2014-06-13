//
//  MTMiscUtils.h
//  ember
//
//  Created by John A Torres B on 5/06/14.
//  Copyright (c) 2014 ember. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EMMiscUtils : NSObject

+ (NSString *)generateGUID;
+ (NSArray *) countryList;
+ (NSData *)encryptString:(NSString *)plaintext withKey:(NSString *)key;
+ (NSString *)decryptData:(NSData *)cipherText withKey:(NSString *)key;
+ (NSDictionary *) countryListFromPlist;
+ (NSString *)platform;
@end
