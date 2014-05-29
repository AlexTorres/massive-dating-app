//
//  EMLoginModelRequest.h
//  ember
//
//  Created by John A Torres B on 11/05/14.
//  Copyright (c) 2014 ember. All rights reserved.
//

#import "EMServiceModel.h"

@interface EMLoginModelRequest : EMServiceModel
@property (nonatomic, copy) NSString *UDID;
@property (nonatomic, copy) NSString *userPhone;

@end
