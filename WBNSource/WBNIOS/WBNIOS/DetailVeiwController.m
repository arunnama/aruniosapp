//
//  DetailVeiwController.m
//  WBNIOS
//
//  Created by Synergy on 27/10/15.
//  Copyright (c) 2015 ArunApp. All rights reserved.
//

#import "DetailVeiwController.h"
#import "applicationStubData.h"

@interface DetailVeiwController ()

@end

@implementation DetailVeiwController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setData];
    
    
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


-(void)setData{
    
    NSDictionary *descDictionary =  [applicationStubData getItemDescription:@"cars"];
    [_desc setText:[descDictionary valueForKey:@"desc"]];
     UIImage *image;
    image = [UIImage imageNamed:@"car2.jpeg"];
    [_detailImage setImage:image];
    
}


@end
