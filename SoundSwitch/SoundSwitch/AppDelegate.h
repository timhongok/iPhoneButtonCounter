//
//  AppDelegate.h
//  SoundSwitch
//
//  Created by Moshe Gottlieb on 6/2/13.
//  Copyright (c) 2013 Moshe Gottlieb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JPSVolumeButtonHandler.h"
#import "SharkfoodMuteSwitchDetector.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    NSInteger powerCount;
    NSInteger increaseCount;
    NSInteger decreaseCount;
    NSInteger soundCount;
    NSInteger homecount;
    JPSVolumeButtonHandler *volumeButtonHandler;
    SharkfoodMuteSwitchDetector* detector;
    __block UIBackgroundTaskIdentifier bgTask;
    __block dispatch_block_t expirationHandler;
   
}

@property (strong, nonatomic) UIWindow *window;

@end
