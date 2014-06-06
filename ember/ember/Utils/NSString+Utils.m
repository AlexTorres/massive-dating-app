//
//  NSString+Utils.m
//  ember
//
//  Created by John A Torres B on 11/05/14.
//  Copyright (c) 2014 ember. All rights reserved.
//

#import "NSString+Utils.h"

@implementation NSString (Utils)

- (NSString *)stringByTrimmingEnds
{
	return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (BOOL)isEmpty
{
	return ([[self stringByReplacingOccurrencesOfString:@" " withString:@""] length] == 0);
}

- (BOOL)isValidEmail
{
	NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
	return [self validateUsingRegex:emailRegex];
}

- (BOOL)validateUsingRegex:(NSString *)regex
{
	NSPredicate *regexTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
	return [regexTest evaluateWithObject:self];
}

- (BOOL)isNumber
{
	return [self validateUsingRegex:@"\\d+"];
}

- (BOOL)isDecimalNumber
{
	return [self validateUsingRegex:@"^\\d*\\.?\\d*$"];
}

@end
