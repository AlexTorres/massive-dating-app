//
//  NSUserDefaults+Utils.h
//  ember
//
//  Created by John A Torres B on 11/05/14.
//  Copyright (c) 2014 ember. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (Utils)

+ (NSString *)stringForKey:(NSString *)key;
+ (id)objectForKey:(NSString *)key;
+ (void)setObject:(id)value forKey:(NSString *)key;

+ (NSString *)decryptedStringForKey:(NSString *)key;
+ (void)encryptAndSetString:(NSString *)string forKey:(NSString *)key;

@end
