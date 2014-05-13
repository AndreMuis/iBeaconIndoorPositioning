//
//  IPBeaconManager.h
//  iBeaconIndoorPositioning
//
//  Created by Andre Muis on 5/12/14.
//  Copyright (c) 2014 Andre Muis. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import <Foundation/Foundation.h>

@protocol IPBeaconManagerDelegate;

@interface IPBeaconManager : NSObject

+ (IPBeaconManager *)beaconManagerWithDelegate: (id<IPBeaconManagerDelegate>)delegate;

- (id)initWithDelegate: (id<IPBeaconManagerDelegate>)delegate;

- (void)startRangingBeaconsWithProximityUUIDAsString: (NSString *)proximityUUIDAsString;

@end
