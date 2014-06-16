//
//  EMLoginService.m
//  ember
//
//  Created by John A Torres B on 11/05/14.
//  Copyright (c) 2014 ember. All rights reserved.
//

#import "EMLoginService.h"
#import "EMLoginModelRequest.h"
#import "EMLoginModelResponse.h"

@implementation EMLoginService

static NSString *const kSingUpPath = @"/v1/users/sign_up";
static NSString *const kSingInPath = @"/v1/users/sign_in";
+ (instancetype)sharedInstance
{
	static dispatch_once_t once;
	static EMLoginService *sharedInstance;
	dispatch_once(&once, ^{
	    sharedInstance = [[EMLoginService alloc] initLoginService];
	});
	return sharedInstance;
}

- (id)init
{
	@throw [NSException singletonExceptionWithClass:[self class]];
}

#pragma mark - Private methods

- (id)initLoginService
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
    
	[self setupRequests];
	[self setupSuccessfulResponses];
}

- (void)setupRequests
{
	[self.objectManager addRequestDescriptor:[RKRequestDescriptor requestDescriptorWithMapping:[EMLoginModelRequest requestMapping]
	                                                                               objectClass:[EMLoginModelRequest class]
	                                                                               rootKeyPath:nil
	                                                                                    method:RKRequestMethodAny]];
}

- (void)setupSuccessfulResponses
{
	// Response descriptor for 2xx status codes.
	[self.objectManager addResponseDescriptor:[RKResponseDescriptor
	                                           responseDescriptorWithMapping:[EMLoginModelResponse responseMapping]
                                               method:RKRequestMethodAny
                                               pathPattern:nil
                                               keyPath:@"user"
                                               statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)]];
    
    

}
- (void)cancelOperationsIfAny
{
	[self.objectManager cancelAllObjectRequestOperationsWithMethod:RKRequestMethodAny
	                                           matchingPathPattern:kSingUpPath];
    
    [self.objectManager cancelAllObjectRequestOperationsWithMethod:RKRequestMethodAny
                                               matchingPathPattern:kSingInPath];
}

#pragma mark - Public methods
-(void) userSingUpPhone:(NSString *)phone
           withPassword:(NSString *)password
                success:(EMServiceSuccessBlock)successBlock
                failure:(EMServiceFailureBlock)failureBlock
{
    self.objectManager.requestSerializationMIMEType = RKMIMETypeJSON;
    EMLoginModelRequest *loginModelRequest = [[EMLoginModelRequest alloc] init];
    loginModelRequest.phone = phone;
    loginModelRequest.password = password;
    NSMutableURLRequest *request = [self.objectManager requestWithObject:loginModelRequest
                                                                  method:RKRequestMethodPOST
                                                                    path:kSingUpPath
                                                              parameters:nil];
    
    // Make the request.
    //DDLogInfo(@"Sending request to the /%@ API", kSingUpPath);
    RKObjectRequestOperation *operation = [self.objectManager objectRequestOperationWithRequest:request success: ^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        if (successBlock) {
            EMLoginModelResponse * objectResponse = mappingResult.firstObject;
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

-(void) userSinginPhone:(NSString *)phone
           withPassword:(NSString *)password
                success:(EMServiceSuccessBlock)successBlock
                failure:(EMServiceFailureBlock)failureBlock
{
    self.objectManager.requestSerializationMIMEType = RKMIMETypeJSON;
    EMLoginModelRequest *loginModelRequest = [[EMLoginModelRequest alloc] init];
    loginModelRequest.phone = phone;
    loginModelRequest.password = password;
    NSMutableURLRequest *request = [self.objectManager requestWithObject:loginModelRequest
                                                                  method:RKRequestMethodGET
                                                                    path:kSingInPath
                                                              parameters:nil];
    
    // Make the request.
    //DDLogInfo(@"Sending request to the /%@ API", kSingUpPath);
    RKObjectRequestOperation *operation = [self.objectManager objectRequestOperationWithRequest:request success: ^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        if (successBlock) {
            EMLoginModelResponse * objectResponse = mappingResult.firstObject;
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
