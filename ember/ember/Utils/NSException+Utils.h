//

//  NException+Utils.h
//  ember
//
//  Created by John A Torres B on 11/05/14.
//  Copyright (c) 2014 ember. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSException(Utils)
+ (NSException *)singletonExceptionWithClass:(Class)clazz;
+ (NSException *)mustOverrideExceptionWithClass:(Class)clazz selector:(SEL)selector;

@end
