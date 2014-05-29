//
//  EMServiceModel.h
//  ember
//
//  Created by John A Torres B on 11/05/14.
//  Copyright (c) 2014 ember. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RKMapping;

@interface EMServiceModel : NSObject
+ (RKMapping *)requestMapping;
+ (RKMapping *)responseMapping;
@end
