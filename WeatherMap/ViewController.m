//
//  ViewController.m
//  WeatherMap
//
//  Created by Student P_10 on 09/11/17.
//  Copyright © 2017 vaishnavifelix. All rights reserved.
//

#import "ViewController.h"
#import "WeatherViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
}
-(void)find
{
    NSString *str = [NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/weather?lat=%f&lon=%f&appid=0621207a178c78e572f9fc5259485496&units=metric",_lat,_lan];
    NSLog(@"%@",str);
    NSURL *myurl = [NSURL URLWithString:str];
    NSLog(@"%@",myurl);
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSURLSessionDataTask *dataTask=[session dataTaskWithURL:myurl completionHandler:^(NSData * _Nullable data, NSURLResponse *_Nullable response, NSError * _Nullable error)
                                    {
                                        NSHTTPURLResponse *myresponse = (NSHTTPURLResponse *)response;
                                        
                                        if(myresponse.statusCode==200)
                                        {
                                            if(data)
                                            {
                                                NSLog(@"Data Found");
                                                NSLog(@"Data is %@",response);
                                                
                                                NSDictionary *mydic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
                                                
                                                if(error)
                                                {
                                                    NSLog(@"Error :%@",error.localizedDescription);
                                                }
                                                else
                                                {
                                                    NSLog(@"Myarray : %@",mydic);
                                                
                                                    NSDictionary *wdic = [mydic valueForKey:@"weather"];
                                                    
                                                    NSLog(@"WHEATHER === %@",wdic);
                                                    
                                                        NSDictionary *tmain = [mydic valueForKey:@"main"];
                                                    
                                                        
                                                        NSLog(@"Main : %@",tmain);
                                                        
                                                        
                                                        _temp = [tmain valueForKey:@"temp"];
                                                    
                                                        _humadity = [tmain valueForKey:@"humidity"];
                                                    
                                                        _desc = [wdic valueForKey:@"description"];
                                                    
                                                    
                                                    
                                                        
                                                    
                                                }
                                                NSLog(@"Temprature :   %@ ",_temp);
                                                NSLog(@"DESC === %@",_desc);
                                                NSLog(@"Humdity = %@",_humadity);
                                            
                                            WeatherViewController *wvc = [[WeatherViewController alloc]init];
                                                
                                                wvc.str1 = [NSString stringWithFormat:@"%@",_temp];
                                                
                                                wvc.str2 = [NSString stringWithFormat:@"%@",_desc];
                                                
                                                
                                                
                                                wvc.str3 = [NSString stringWithFormat:@"%@",_humadity];
                                                
                                                
                                                
                                            }
                                        }
                                        else
                                        {
                                            NSLog(@"Data not found");
                                        }
                                        
                                        
                                        
                                        
                                        
                                    }];
    [dataTask resume];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)info
{
    NSString *location=self.tfcityname.text;
    CLGeocoder *geocoder=[[CLGeocoder alloc]init];
    [geocoder geocodeAddressString:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
//        if (placemarks && placemarks.count>0) {
//            CLPlacemark *topresult=[placemarks objectAtIndex:0];
//            MKPlacemark *placemark=[[MKPlacemark alloc]initWithPlacemark:topresult];
        
            MKCoordinateRegion region=self.mymapview.region;
            //region.center=placemark.region.center;
            _lan = region.span.longitudeDelta;
            _lat = region.span.latitudeDelta;
            
            [self.mymapview setRegion:region];
            //[self.mymapview addAnnotation:placemark];
            
            
        
    }];
}

- (IBAction)FindWeather:(id)sender {
    
    [self find];
}
@end
