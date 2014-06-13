//
//  OCManager.h
//  GithubMonitor
//
//  Created by John A Torres B on 22/05/14.
//  Copyright (c) 2014 Globant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EMManager : NSObject
typedef void (^EMManagerSuccessBlock)(id);
typedef void (^EMManagerBooleanSuccessBlock)(BOOL);
typedef void (^EMManagerFailureBlock)(NSError *);

@end
