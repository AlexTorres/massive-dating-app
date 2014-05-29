//
//  EMLoginModelResponse.m
//  ember
//
//  Created by John A Torres B on 11/05/14.
//  Copyright (c) 2014 ember. All rights reserved.
//

#import "EMLoginModelResponse.h"

@implementation EMLoginModelResponse

+ (RKMapping *)requestMapping
{
	RKObjectMapping *mapping = [RKObjectMapping requestMapping];
	NSDictionary *mappingDict = @{
                                  @"UserCode" : @"userCode"
                                  };
    
	[mapping addAttributeMappingsFromDictionary:mappingDict];
	return mapping;
}
@end
