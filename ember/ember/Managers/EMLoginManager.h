//
//  EMLoginManager.h
//  ember
//
//  Created by John A Torres B on 10/05/14.
//  Copyright (c) 2014 ember. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EMManager.h"

@interface EMLoginManager : EMManager

+ (instancetype)sharedInstance;

- (void)loginForPhone:(NSString *)phone
         withPassword:(NSString *)password
              success:(EMManagerSuccessBlock) successBlock
              failure:(EMManagerFailureBlock) failureBlock;

- (void)codeForPhone:(NSString *)phone
        withPassword:(NSString *)password
             success:(EMManagerSuccessBlock) successBlock
             failure:(EMManagerFailureBlock) failureBlock;
@end
