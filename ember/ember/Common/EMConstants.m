//
//  EMConstants.m
//  ember
//
//  Created by John A Torres B on 23/05/14.
//  Copyright (c) 2014 ember. All rights reserved.
//

NSString *MTBaseServerUrl()
{
    // APIs base URL.
#ifdef DEBUG
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"test.api.server.base.url"];
#else
    // TODO: Replace URL for production.
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"prod.api.server.base.url"];
#endif
}