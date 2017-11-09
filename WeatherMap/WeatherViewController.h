//
//  WeatherViewController.h
//  WeatherMap
//
//  Created by Student P_10 on 09/11/17.
//  Copyright © 2017 vaishnavifelix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface WeatherViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *temp;
@property (strong, nonatomic) IBOutlet UILabel *desc;
@property (strong, nonatomic) IBOutlet UILabel *humidity;
@property(nonatomic,retain)NSString *str1,*str2,*str3;

@end
