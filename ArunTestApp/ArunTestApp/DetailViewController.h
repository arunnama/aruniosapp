//
//  DetailViewController.h
//  ArunTestApp
//
//  Created by Synergy on 21/9/15.
//  Copyright (c) 2015 ArunTesting. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

