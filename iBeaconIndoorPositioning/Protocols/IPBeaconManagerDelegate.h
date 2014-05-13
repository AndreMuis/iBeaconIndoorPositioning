//
//  IPBeaconManagerDelegate.h
//  iBeaconIndoorPositioning
//
//  Created by Andre Muis on 5/12/14.
//  Copyright (c) 2014 Andre Muis. All rights reserved.
//

@class IPBeaconManager;

@protocol IPBeaconManagerDelegate <NSObject>

@required

- (void)   beaconManager: (IPBeaconManager *)beaconManager
  didUpdateClosestBeacon: (CLBeacon *)closestBeacon;

- (void)beaconManager: (IPBeaconManager *)beaconManager
    didEncounterError: (NSError *)error;

@end

