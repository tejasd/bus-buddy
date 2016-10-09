//
//  AppDelegate.m
//  Bus Buddy
//
//  Created by Tejas Deshpande on 10/8/16.
//  Copyright © 2016 Tejas Deshpande. All rights reserved.
//

#import "AppDelegate.h"

#import "GooglePlaces/GooglePlaces.h"

@import Firebase;
@import UserNotifications;

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [GMSPlacesClient provideAPIKey:@"AIzaSyDcp-m4-wkk_wqbcqZRTJvOTUHD_AU2ssM"];
    
    
    UNNotificationAction *yesAction = [UNNotificationAction actionWithIdentifier:@"YES_IDENTIFIER" title:@"Yes" options:UNNotificationActionOptionNone];
    UNNotificationAction *noAction = [UNNotificationAction actionWithIdentifier:@"NO_IDENTIFIER" title:@"No" options:UNNotificationActionOptionNone];
    
    
    
    UNNotificationCategory *category = [UNNotificationCategory categoryWithIdentifier:@"POLL_CATEGORY" actions:@[yesAction, noAction] intentIdentifiers:@[] options:UNNotificationCategoryOptionNone];
    

    
    UNAuthorizationOptions authOptions = UNAuthorizationOptionAlert | UNAuthorizationOptionSound | UNAuthorizationOptionBadge;
    
    [[UNUserNotificationCenter currentNotificationCenter] requestAuthorizationWithOptions:authOptions completionHandler:^(BOOL granted, NSError * _Nullable error) {
        [[UNUserNotificationCenter currentNotificationCenter] setNotificationCategories:@[category]];
        }
     ];
    
    // For iOS 10 display notification (sent via APNS)
    [[UNUserNotificationCenter currentNotificationCenter] setDelegate:self];
    // For iOS 10 data message (sent via FCM)
    [[FIRMessaging messaging] setRemoteMessageDelegate:self];


    [[UIApplication sharedApplication] registerForRemoteNotifications];
    
    
    //    let newsCategory = UIMutableUserNotificationCategory()
//    newsCategory.identifier = "NEWS_CATEGORY"
//    newsCategory.setActions([viewAction], forContext: .Default)
    
    // [END register_for_notifications]
    
    // [START configure_firebase]
    [FIRApp configure];
    // [END configure_firebase]
    // Add observer for InstanceID token refresh callback.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tokenRefreshNotification:)
                                                 name:kFIRInstanceIDTokenRefreshNotification object:nil];

    
//    [self registerForPushNotifications:application];
    
    return YES;
}

- (void)tokenRefreshNotification:(NSNotification *)notification {
    // Note that this callback will be fired everytime a new token is generated, including the first
    // time. So if you need to retrieve the token as soon as it is available this is where that
    // should be done.
    NSString *refreshedToken = [[FIRInstanceID instanceID] token];
    NSLog(@"InstanceID token: %@", refreshedToken);
    
    // Connect to FCM since connection may have failed when attempted before having a token.
//    [self connectToFcm];
    
    // TODO: If necessary send token to application server.
}

// [START connect_to_fcm]
- (void)connectToFcm {
    [[FIRMessaging messaging] connectWithCompletion:^(NSError * _Nullable error) {
        if (error != nil) {
            NSLog(@"Unable to connect to FCM. %@", error);
        } else {
            NSLog(@"Connected to FCM.");
        }
    }];
}
// [END connect_to_fcm]

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings {
    if (notificationSettings != UIUserNotificationTypeNone) {
        [application registerForRemoteNotifications];
    }
}

//- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
//    const unsigned *tokenBytes = [deviceToken bytes];
//    NSString *hexToken = [NSString stringWithFormat:@"%08x%08x%08x%08x%08x%08x%08x%08x",
//                          ntohl(tokenBytes[0]), ntohl(tokenBytes[1]), ntohl(tokenBytes[2]),
//                          ntohl(tokenBytes[3]), ntohl(tokenBytes[4]), ntohl(tokenBytes[5]),
//                          ntohl(tokenBytes[6]), ntohl(tokenBytes[7])];
//    
//    NSLog(@"Hex token: %@", hexToken);
//}
//
//- (void)registerForPushNotifications: (UIApplication *)application {
//    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|UIUserNotificationTypeSound categories:nil];
//    
//    [application registerUserNotificationSettings:settings];
//    
//}


- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    const unsigned *tokenBytes = [deviceToken bytes];
    NSString *hexToken = [NSString stringWithFormat:@"%08x%08x%08x%08x%08x%08x%08x%08x",
                          ntohl(tokenBytes[0]), ntohl(tokenBytes[1]), ntohl(tokenBytes[2]),
                          ntohl(tokenBytes[3]), ntohl(tokenBytes[4]), ntohl(tokenBytes[5]),
                          ntohl(tokenBytes[6]), ntohl(tokenBytes[7])];

    NSLog(@"Hex token: %@", hexToken);
}

//- (void)registerForPushNotifications: (UIApplication *)application {
//    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|UIUserNotificationTypeSound categories:nil];
//
//    [application registerUserNotificationSettings:settings];
//
//}



@end
