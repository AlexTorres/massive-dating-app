//
//  EMCountryService.h
//  ember
//
//  Created by John A Torres B on 12/06/14.
//  Copyright (c) 2014 ember. All rights reserved.
//

#import "EMService.h"

@interface EMCountriesService : EMService
+ (instancetype)sharedInstance;
- (void) countriesWithSuccess:(EMServiceSuccessBlock)successBlock
                        failure:(EMServiceFailureBlock)failureBlock;

@end
