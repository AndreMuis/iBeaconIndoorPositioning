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

@property (weak, nonatomic) IBOutlet UILabel *majorLabel;
@property (weak, nonatomic) IBOutlet UILabel *minorLabel;
@property (weak, nonatomic) IBOutlet UITextView *errorMessageTextView;

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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.majorLabel.backgroundColor = [UIColor clearColor];
    self.minorLabel.backgroundColor = [UIColor clearColor];
    self.errorMessageTextView.backgroundColor = [UIColor colorWithWhite: 0.85 alpha: 1.0];
}

- (void)viewDidAppear: (BOOL)animated
{
    [super viewDidAppear: animated];
    
    [self.beaconManager startRangingBeaconsWithProximityUUIDAsString: IPProximityUUIDAsString];
}

- (void)beaconManager: (IPBeaconManager *)beaconManager didUpdateClosestBeacon: (CLBeacon *)closestBeacon
{
    self.majorLabel.text = [NSString stringWithFormat: @"%d", [closestBeacon.major integerValue]];
    self.minorLabel.text = [NSString stringWithFormat: @"%d", [closestBeacon.minor integerValue]];
}

- (void)beaconManager: (IPBeaconManager *)beaconManager didEncounterError: (NSError *)error
{
    self.errorMessageTextView.text = [NSString stringWithFormat: @"%@", error];
}

@end
















