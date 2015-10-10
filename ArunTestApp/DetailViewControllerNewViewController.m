//
//  DetailViewControllerNewViewController.m
//  ArunTestApp
//
//  Created by Synergy on 27/9/15.
//  Copyright (c) 2015 ArunTesting. All rights reserved.
//

#import "DetailViewControllerNewViewController.h"

@interface DetailViewControllerNewViewController ()

@end

@implementation DetailViewControllerNewViewController

- (void)viewDidLoad {
    
    NSLog(@"New View Controller Detail");
    [super viewDidLoad];
    
  //  [self loadData];
    // Do any additional setup after loading the view.
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
-(void) loadData:(NSString*)inputData{
    
    
    
    NSLog(@"Calling Load Data %@",inputData);
    
}


@end
