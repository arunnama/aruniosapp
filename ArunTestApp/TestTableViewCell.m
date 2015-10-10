//
//  TestTableViewCell.m
//  ArunTestApp
//
//  Created by Synergy on 29/9/15.
//  Copyright (c) 2015 ArunTesting. All rights reserved.
//

#import "TestTableViewCell.h"

@implementation TestTableViewCell

@synthesize textTitle;
@synthesize textTitleDesc;
@synthesize TitleImageView;


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
