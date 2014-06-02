//
//  EMAppDelegate.m
//  ember
//
//  Created by John A Torres B on 10/05/14.
//  Copyright (c) 2014 ember. All rights reserved.
//

#import "EMAppDelegate.h"

@implementation EMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [self setupLogging];
    [self setupServices];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)setupLogging
{
	[DDLog addLogger:[DDASLLogger sharedInstance]];
	[DDLog addLogger:[DDTTYLogger sharedInstance]];
    
#ifdef DEBUG
	RKLogConfigureByName("RestKit/Network", RKLogLevelTrace);
	RKLogConfigureByName("RestKit/ObjectMapping", RKLogLevelInfo);
#else
	RKLogConfigureByName("RestKit", RKLogLevelError);
	RKLogConfigureByName("RestKit/ObjectMapping", RKLogLevelError);
#endif
}
- (void)setupServices
{
    NSString *baseServerUrl = MTBaseServerUrl();
    
    RKObjectManager* objectManager = [RKObjectManager managerWithBaseURL:[NSURL URLWithString:baseServerUrl]];

    objectManager.HTTPClient.allowsInvalidSSLCertificate = YES;
    //[objectManager.HTTPClient setDefaultHeader:@"Content-Encoding" value:@"gzip"];
    
    [RKObjectManager setSharedManager:objectManager];
    
	// Add common http header fields, for example:
	//DDLogInfo(@"Setting header '%@' with value '%@' for all requests", kAPIsHeaderFieldName, kAPIsHeaderFieldValue);
	//[self.objectManager.HTTPClient setDefaultHeader:kAPIsHeaderFieldName value:kAPIsHeaderFieldValue];
    
	// We should always get JSONs from the APIs. If some of them don't return application/json,
	// force them to still be deserialized as JSON.
	[RKMIMETypeSerialization registerClass:[RKNSJSONSerialization class] forMIMEType:@"text/html"];
	[RKMIMETypeSerialization registerClass:[RKNSJSONSerialization class] forMIMEType:@"text/plain"];
    
	[RKObjectMapping class]; // Called so that RKObjectMapping initializes, as it adds a valueTransformer for date at index 0, and we want ours to be the one at index 0
    RKCompoundValueTransformer *defaultValueTransformer = [RKValueTransformer defaultValueTransformer];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    [defaultValueTransformer insertValueTransformer:dateFormatter atIndex:0];

}

@end
