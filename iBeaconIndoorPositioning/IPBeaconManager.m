//
//  IPBeaconManager.m
//  iBeaconIndoorPositioning
//
//  Created by Andre Muis on 5/12/14.
//  Copyright (c) 2014 Andre Muis. All rights reserved.
//

#import "IPBeaconManager.h"

#import "IPBeaconManagerDelegate.h"

@interface IPBeaconManager () <CLLocationManagerDelegate>

@property (readonly, weak, nonatomic) id<IPBeaconManagerDelegate> delegate;

@property (readonly, strong, nonatomic) CLLocationManager *locationManager;

@end

@implementation IPBeaconManager

+ (IPBeaconManager *)beaconManagerWithDelegate: (id<IPBeaconManagerDelegate>)delegate
{
    IPBeaconManager *beaconManager = [[IPBeaconManager alloc] initWithDelegate: delegate];
    return beaconManager;
}

- (id)initWithDelegate: (id<IPBeaconManagerDelegate>)delegate
{
    self = [super init];
    
    if (self)
    {
        _delegate = delegate;
        
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
    }
    
    return self;
}

- (void)startRangingBeaconsWithProximityUUIDAsString: (NSString *)proximityUUIDAsString
{
    NSUUID *proximityUUID = [[NSUUID alloc] initWithUUIDString: proximityUUIDAsString];
    
    CLBeaconRegion *beaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID: proximityUUID
                                                                      identifier: @""];
        
    [self.locationManager startRangingBeaconsInRegion: beaconRegion];
}

- (void)locationManager: (CLLocationManager *)manager
        didRangeBeacons: (NSArray *)beacons
               inRegion: (CLBeaconRegion *)region
{
    if (beacons.count >= 1)
    {
        NSPredicate *predicte = [NSPredicate predicateWithFormat: @"proximity != %d", CLProximityUnknown];
        
        NSArray *filteredBeacons = [beacons filteredArrayUsingPredicate: predicte];
        
        if (filteredBeacons.count >= 1)
        {
            [self.delegate beaconManager: self didUpdateClosestBeacon: filteredBeacons[0]];
        }
    }
}

- (void)         locationManager: (CLLocationManager *)manager
  rangingBeaconsDidFailForRegion: (CLBeaconRegion *)region
                       withError: (NSError *)error
{
    [self.delegate beaconManager: self didEncounterError: error];
}

@end
















