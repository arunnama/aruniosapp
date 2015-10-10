//
//  TestTableViewCell.h
//  ArunTestApp
//
//  Created by Synergy on 29/9/15.
//  Copyright (c) 2015 ArunTesting. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *textTitle;

@property (strong, nonatomic) IBOutlet UILabel *textTitleDesc;
@property (strong, nonatomic) IBOutlet UIImageView *TitleImageView;

@end
