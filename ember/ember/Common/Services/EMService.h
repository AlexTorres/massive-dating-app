//
//  EMService.h
//  ember
//
//  Created by John A Torres B on 11/05/14.
//  Copyright (c) 2014 ember. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EMService : NSObject
@property (nonatomic, strong, readonly) RKObjectManager *objectManager;
typedef void (^EMServiceSuccessBlock)(id);
typedef void (^EMServiceBooleanSuccessBlock)(BOOL);
typedef void (^EMServiceFailureBlock)(NSError *);

@end
