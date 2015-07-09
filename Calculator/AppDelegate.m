//
//  AppDelegate.m
//  Calculator
//
//  Created by HsuAnny on 6/24/15.
//  Copyright (c) 2015 HsuAnny. All rights reserved.
//

#import "AppDelegate.h"
#import "Branch.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // Initialize the session, set up a deep link handler
    Branch *branch = [Branch getInstance];
    [branch initSessionWithLaunchOptions:launchOptions andRegisterDeepLinkHandler:^(NSDictionary *params, NSError *error) {
        
        // Start setting up the view controller hierarchy
        UINavigationController *navC = (UINavigationController*) self.window.rootViewController;
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *nextVC;
        
        // If the key 'pictureId' is presented in the deep link dictionary
        // then load the picture screen with the appropriate picture
        NSString *pictureId = [params objectForKey:@"pictureId"];
        if (pictureId){
            NSLog(@"Using PicVC");
            nextVC = [storyboard instantiateViewControllerWithIdentifier:@"PicVC"];
       //     [nextVC setNextPictureId:pictureId];  NOT WORKING
       //     [nextVC setValue:pictureId forKey:@"pictureId"];
        } else {
            NSLog(@"Using mainVC");
            nextVC = [storyboard instantiateViewControllerWithIdentifier:@"MainVC"];
        }
        
     //   [navC setViewControllers:@[nextVC] animated:YES];
        
        if (!error) {
            // params are the deep linked params associated with the link that the user clicked -> was re-directed to this app
            // params will be empty if no data found
            // ... insert custom logic here ...
            NSLog(@"params: %@", params.description);
        }
        else{
            NSLog(@"THERE IS ERROR: %@", error);
        }

        
    }];
    
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    // pass the url to the handle deep link call
   if (![[Branch getInstance] handleDeepLink:url]) {
        // do other deep link routing for the Facebook SDK, Pinterest SDK, etc
       NSLog(@"Am I here?");
        
        //Create branch link
        [[Branch getInstance] getShortURLWithParams:@{@"foo": @"bar"} andChannel:@"sms" andFeature:BRANCH_FEATURE_TAG_SHARE andCallback:^(NSString *url, NSError *error) {
            if (!error) NSLog(@"got my Branch link to share: %@", url);
        }];
    }
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
