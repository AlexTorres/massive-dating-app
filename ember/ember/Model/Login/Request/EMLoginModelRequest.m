//
//  EMLoginModelRequest.m
//  ember
//
//  Created by John A Torres B on 11/05/14.
//  Copyright (c) 2014 ember. All rights reserved.
//

#import "EMLoginModelRequest.h"

@implementation EMLoginModelRequest
+ (RKMapping *)requestMapping
{
	RKObjectMapping *mapping = [RKObjectMapping requestMapping];
	NSDictionary *mappingDict = @{
                                  @"UDID" : @"UDID",
                                  @"userPhone" : @"UserPhone"
                                  };
    
	[mapping addAttributeMappingsFromDictionary:mappingDict];
	return mapping;
}
@end
