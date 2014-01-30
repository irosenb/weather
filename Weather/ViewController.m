//
//  ViewController.m
//  Weather
//
//  Created by Isaac Rosenberg on 1/27/14.
//  Copyright (c) 2014 Isaac Rosenberg. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "AKLocationManager.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize title;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
//    CLLocationManager *location = [[CLLocationManager alloc] init];
    
    [AKLocationManager startLocatingWithUpdateBlock:^(CLLocation *location) {
        CLGeocoder *geoCoder = [[CLGeocoder alloc] init];
        [geoCoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
            CLPlacemark *place = [placemarks objectAtIndex:0];
            
            title.title = [NSString stringWithFormat:@"%@, %@", place.locality, place.administrativeArea];
            
        }];
    } failedBlock:^(NSError *error) {
        NSLog(@"It failed!");
    }];
    
    
    
//    title.title = location.location;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
