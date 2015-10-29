//
//  CategoryCell.m
//  WBNIOS
//
//  Created by Synergy on 22/10/15.
//  Copyright (c) 2015 ArunApp. All rights reserved.
//

#import "CategoryCell.h"

@implementation CategoryCell


- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.lblArun = [[UILabel alloc] initWithFrame:self.bounds];
        self.autoresizesSubviews = YES;
        self.lblArun.autoresizingMask = (UIViewAutoresizingFlexibleWidth |
                                       UIViewAutoresizingFlexibleHeight);
        self.lblArun.font = [UIFont boldSystemFontOfSize:42];
        self.lblArun.textAlignment = NSTextAlignmentCenter;
        self.lblArun.adjustsFontSizeToFitWidth = YES;
        
        [self addSubview:self.lblArun];
        
        [self setNumber:0];
    }
    return self;
}

- (void)setNumber:(NSString*)valueOfString {
    self.lblArun.text = [NSString stringWithFormat:@"%@", valueOfString];
}
@end
