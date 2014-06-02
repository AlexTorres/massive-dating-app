//
//  EMLoginManager.h
//  ember
//
//  Created by John A Torres B on 10/05/14.
//  Copyright (c) 2014 ember. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EMLoginManager : NSObject

+ (instancetype)sharedInstance;
- (NSString *)codeForPhone:(NSString *)phone
       withPassword:(NSString *)password;
@end
