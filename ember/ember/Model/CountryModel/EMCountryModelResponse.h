//
//  EMCountryResponseModel.h
//  ember
//
//  Created by John A Torres B on 13/06/14.
//  Copyright (c) 2014 ember. All rights reserved.
//

#import "EMServiceModel.h"

@interface EMCountryModelResponse : EMServiceModel
@property (nonatomic, copy) NSString *iso;
@property (nonatomic, assign) NSInteger idCountry;
@property (nonatomic, copy) NSString *callingCode;
@property (nonatomic, copy) NSString *name;


@end
