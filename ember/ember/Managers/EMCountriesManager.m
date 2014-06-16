//
//  EMCountriesManager.m
//  ember
//
//  Created by John A Torres B on 15/06/14.
//  Copyright (c) 2014 ember. All rights reserved.
//

#import "EMCountriesManager.h"
#import "EMCountriesService.h"

@implementation EMCountriesManager
+ (instancetype)sharedInstance
{
    static dispatch_once_t once;
    static EMCountriesManager *sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[EMCountriesManager alloc] initCountryManager];
    });
    return sharedInstance;
}

- (id)init
{
    @throw [NSException singletonExceptionWithClass:[self class]];
}


- (void)countriesWithSuccess:(EMManagerSuccessBlock) successBlock
                        failure:(EMManagerFailureBlock) failureBlock {
    
    [[EMCountriesService sharedInstance] countriesWithSuccess:^(id response) {
                                                 successBlock(response);
                                                 
                                             } failure:^(NSError *error) {
                                                 failureBlock(error);
                                                 
                                             }];
}

#pragma mark - Private methods

- (id)initCountryManager
{
    self = [super init];
    if (self)
    {
        
    }
    return self;
}

@end
