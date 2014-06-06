//
//  NSString+Utils.h
//  ember
//
//  Created by John A Torres B on 11/05/14.
//  Copyright (c) 2014 ember. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *const kStringEmpty = @"";

@interface NSString (Utils)

- (NSString *)stringByTrimmingEnds;
- (BOOL)isEmpty;
- (BOOL)isValidEmail;
- (BOOL)validateUsingRegex:(NSString *)regex;
- (BOOL)isNumber;
- (BOOL)isDecimalNumber;


@end
