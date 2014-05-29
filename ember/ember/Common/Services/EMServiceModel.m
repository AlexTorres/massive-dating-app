//
//  EMServiceModel.m
//  ember
//
//  Created by John A Torres B on 11/05/14.
//  Copyright (c) 2014 ember. All rights reserved.
//

#import "EMServiceModel.h"

@implementation EMServiceModel
+ (RKMapping *)requestMapping
{
	@throw [NSException mustOverrideExceptionWithClass:[self class] selector:_cmd];
}

+ (RKMapping *)responseMapping
{
	@throw [NSException mustOverrideExceptionWithClass:[self class] selector:_cmd];
}

@end
