//
//  EMLocalDataManager.h
//  ember
//
//  Created by John A Torres B on 5/06/14.
//  Copyright (c) 2014 ember. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EMManager.h"

@interface EMLocalDataManager : EMManager
+ (instancetype)sharedInstance;
@property (nonatomic, weak) NSString *userPhone;
@property (nonatomic, weak) NSString *userToken;
@property (nonatomic, weak) NSString *userPassword;
@property (nonatomic, weak) NSArray *countryList;
@property (nonatomic, weak) NSDictionary *countryPlist;
@end
