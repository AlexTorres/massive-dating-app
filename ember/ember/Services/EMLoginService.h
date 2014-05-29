//
//  EMLoginService.h
//  ember
//
//  Created by John A Torres B on 11/05/14.
//  Copyright (c) 2014 ember. All rights reserved.
//

#import "EMService.h"

@interface EMLoginService : EMService
- (void) userSingUpPhone:(NSString *)phone withPassword:(NSString *)password success:(EMServiceSuccessBlock)successBlock
                 failure:(EMServiceSuccessBlock)failureBlock;

@end
