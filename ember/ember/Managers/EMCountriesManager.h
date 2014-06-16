//
//  EMCountriesManager.h
//  ember
//
//  Created by John A Torres B on 15/06/14.
//  Copyright (c) 2014 ember. All rights reserved.
//

#import "EMManager.h"

@interface EMCountriesManager : EMManager
+ (instancetype)sharedInstance;
- (void)countriesWithSuccess:(EMManagerSuccessBlock) successBlock
                        failure:(EMManagerFailureBlock) failureBlock;
@end
