//
//  EMCountryService.m
//  ember
//
//  Created by John A Torres B on 12/06/14.
//  Copyright (c) 2014 ember. All rights reserved.
//

#import "EMCountriesService.h"
#import "EMCountriesModelResponse.h"
@implementation EMCountriesService

static NSString *const kCountriesPath = @"/v1/countries";
+ (instancetype)sharedInstance
{
    static dispatch_once_t once;
    static EMCountriesService *sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[EMCountriesService alloc] initCountiesService];
    });
    return sharedInstance;
}

- (id)init
{
    @throw [NSException singletonExceptionWithClass:[self class]];
}

#pragma mark - Private methods

- (id)initCountiesService
{
    self = [super init];
    if (self)
    {
        [self setupService];
    }
    return self;
}

- (void)setupService
{
    //DDLogInfo(@"Setting up login...");
    

    [self setupSuccessfulResponses];
}



- (void)setupSuccessfulResponses
{

    [self.objectManager addResponseDescriptor:[RKResponseDescriptor
                                               responseDescriptorWithMapping:[EMCountriesModelResponse responseMapping]
                                               method:RKRequestMethodAny
                                               pathPattern:nil
                                               keyPath:nil
                                               statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)]];
    
    
    
}
- (void)cancelOperationsIfAny
{
    [self.objectManager cancelAllObjectRequestOperationsWithMethod:RKRequestMethodAny
                                               matchingPathPattern:kCountriesPath];

}
- (void) countriesWithSuccess:(EMServiceSuccessBlock)successBlock
                        failure:(EMServiceFailureBlock)failureBlock
{
    self.objectManager.requestSerializationMIMEType = RKMIMETypeJSON;
    NSMutableURLRequest *request = [self.objectManager requestWithObject:nil
                                                                  method:RKRequestMethodGET
                                                                    path:kCountriesPath
                                                              parameters:nil];
    
    // Make the request.
    //DDLogInfo(@"Sending request to the /%@ API", kSingUpPath);
    RKObjectRequestOperation *operation = [self.objectManager objectRequestOperationWithRequest:request success: ^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        if (successBlock) {
            EMCountriesModelResponse * objectResponse = mappingResult.firstObject;
            successBlock(objectResponse);
        }
    } failure: ^(RKObjectRequestOperation *operation, NSError *error) {
        
        // DDLogInfo(@"/%@ error: %@", kSingUpPath, [error localizedDescription]);
        if (failureBlock) {
            failureBlock(error);
        }
    }];
    
    [self.objectManager enqueueObjectRequestOperation:operation];
}



@end
