//
//  EMLoginModelResponse.m
//  ember
//
//  Created by John A Torres B on 11/05/14.
//  Copyright (c) 2014 ember. All rights reserved.
//

#import "EMLoginModelResponse.h"

@implementation EMLoginModelResponse

+ (RKMapping *)responseMapping
{
	RKObjectMapping *mapping = [RKObjectMapping requestMapping];
	NSDictionary *mappingDict = @{
                                  @"access_token" : @"accessToken",
                                  @"is_confirmed" : @"isConfirmed"
                                  };
    
	[mapping addAttributeMappingsFromDictionary:mappingDict];
	return mapping;
}
@end
