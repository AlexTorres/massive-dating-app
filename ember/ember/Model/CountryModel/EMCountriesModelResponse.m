//
//  EMCountriesModelResponse.m
//  ember
//
//  Created by John A Torres B on 13/06/14.
//  Copyright (c) 2014 ember. All rights reserved.
//

#import "EMCountriesModelResponse.h"
#import "EMCountryModelResponse.h"

@implementation EMCountriesModelResponse

+ (RKMapping *)responseMapping
{
    RKObjectMapping *mapping =[RKObjectMapping mappingForClass:[EMCountriesModelResponse class]];
    [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"countries"
                                                                            toKeyPath:@"countries"
                                                                          withMapping:[EMCountryModelResponse responseMapping]]];
    
    return mapping;
}

@end
