//
//  MTMiscUtils.h
//  ember
//
//  Created by John A Torres B on 5/06/14.
//  Copyright (c) 2014 ember. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EMMiscUtils : NSObject

+ (NSString *)generateGUID;
+ (NSString *)identifier;
+ (NSData *)encryptString:(NSString *)plaintext withKey:(NSString *)key;
+ (NSString *)decryptData:(NSData *)cipherText withKey:(NSString *)key;
+ (NSString *)platform;
+ (NSString *)deviceModel;
+ (NSString *)deviceType;

+ (void)askForPinIfRequiredWithWithTitle:(NSString*)title
                                 message:(NSString*)message
                                  footer:(NSString*)footer
                         completionBlock:(void (^)(NSString *pin))completionBlock
                             cancelBlock:(void(^)())cancelBlock;

+ (void)askForPinIfRequiredWithCompletionBlock:(void (^)(NSString *pin))completionBlock;

+ (void)askForPinIfRequiredWithCompletionBlock:(void (^)(NSString *pin))completionBlock cancelBlock:(void(^)())cancelBlock;

+ (void)callCustomerRepresentative;

+ (void)methodSwizzleWithClass:(Class)targetClass originalSelector:(SEL)originalSelector newSelector:(SEL)newSelector;

@end
