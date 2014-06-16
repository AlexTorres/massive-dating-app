//
//  EMCountryResponseModel.m
//  ember
//
//  Created by John A Torres B on 13/06/14.
//  Copyright (c) 2014 ember. All rights reserved.
//

#import "EMCountryModelResponse.h"

@implementation EMCountryModelResponse
+ (RKMapping *)responseMapping
{
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[EMCountryModelResponse class]];
    NSDictionary *mappingDict = @{
                                  @"iso" : @"iso",
                                  @"id" : @"idCountry",
                                  @"calling" : @"callingCode",
                                  @"name" : @"name"
                                  };
    
   [mapping addAttributeMappingsFromDictionary:mappingDict];
    return mapping;
}


+ (RKMapping *)requestMapping
{
    RKObjectMapping *mapping = [RKObjectMapping requestMapping];

    return mapping;
}
@end
