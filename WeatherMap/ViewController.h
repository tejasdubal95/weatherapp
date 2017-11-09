//
//  ViewController.h
//  WeatherMap
//
//  Created by Student P_10 on 09/11/17.
//  Copyright © 2017 vaishnavifelix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "WeatherViewController.h"
#define key1 0621207a178c78e572f9fc5259485496
#define url http://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=0621207a178c78e572f9fc5259485496&units

@interface ViewController : UIViewController<MKMapViewDelegate,CLLocationManagerDelegate>

@property float lat,lan;
@property CLLocationManager *locationmanager;
@property(nonatomic,retain)NSString *temp,*desc,*humadity;

@property (strong, nonatomic) IBOutlet MKMapView *mapkit;
@property (strong, nonatomic) IBOutlet UITextField *tfcityname;
- (IBAction)FindWeather:(id)sender;
@property(nonatomic,retain)MKMapView *mymapview;




@end

