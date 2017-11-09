//
//  WeatherViewController.m
//  WeatherMap
//
//  Created by Student P_10 on 09/11/17.
//  Copyright © 2017 vaishnavifelix. All rights reserved.
//

#import "WeatherViewController.h"


@interface WeatherViewController ()

@end

@implementation WeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _temp = [[UILabel alloc]init];
    
    _desc = [[UILabel alloc]init];

    
    _humidity = [[UILabel alloc]init];

    _temp.text = _str1;
    _desc.text = _str2;
    _humidity.text = _str3;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
