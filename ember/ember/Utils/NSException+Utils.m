//
//  NException+Utils.m
//  ember
//
//  Created by John A Torres B on 11/05/14.
//  Copyright (c) 2014 ember. All rights reserved.
//

#import "NSException+Utils.h"

@implementation NSException (Utils)

+ (NSException *)singletonExceptionWithClass:(Class)clazz
{
	return [NSException exceptionWithName:@"EMSingletonInstantiationException" reason:[NSString stringWithFormat:@"Cannot instantiate an object of class '%@'. It's a singleton and there should be a method called sharedInstance to get the instance.", NSStringFromClass(clazz)] userInfo:nil];
}

+ (NSException *)mustOverrideExceptionWithClass:(Class)clazz selector:(SEL)selector
{
	return [NSException exceptionWithName:@"EMMustOverrideException" reason:[NSString stringWithFormat:@"The method named '%@' must be overriden in class named '%@'.", NSStringFromSelector(selector), NSStringFromClass(clazz)] userInfo:nil];
}

@end
