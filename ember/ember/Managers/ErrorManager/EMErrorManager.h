//
//  OCErrorManager.h
//  GithubMonitor
//
//  Created by John A Torres B on 28/05/14.
//  Copyright (c) 2014 Globant. All rights reserved.
//

#import "EMManager.h"

@interface EMErrorManager : EMManager
+ (instancetype)sharedInstance;
- (void)handleError:(NSError *)error withMessage:(NSString*)message;


@end
