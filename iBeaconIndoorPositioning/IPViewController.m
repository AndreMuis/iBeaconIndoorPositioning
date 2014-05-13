//
//  IPViewController.m
//  iBeaconIndoorPositioning
//
//  Created by Andre Muis on 5/12/14.
//  Copyright (c) 2014 Andre Muis. All rights reserved.
//

#import "IPViewController.h"

#import "IPBeaconManager.h"
#import "IPBeaconManagerDelegate.h"
#import "IPConstants.h"

@interface IPViewController () <IPBeaconManagerDelegate>

@property (readonly, strong, nonatomic) IPBeaconManager *beaconManager;

@end

@implementation IPViewController

- (id)initWithCoder: (NSCoder *)aDecoder
{
    self = [super initWithCoder: aDecoder];
    
    if (self)
    {
        _beaconManager = [IPBeaconManager beaconManagerWithDelegate: self];
    }
    
    return self;
}

- (void)viewDidAppear: (BOOL)animated
{
    [super viewDidAppear: animated];
    
    [self.beaconManager startRangingBeaconsWithProximityUUIDAsString: IPProximityUUIDAsString];
}

- (void)beaconManager: (IPBeaconManager *)beaconManager didUpdateClosestBeacon: (CLBeacon *)closestBeacon
{
}

- (void)beaconManager: (IPBeaconManager *)beaconManager didEncounterError: (NSError *)error
{
}

@end
















