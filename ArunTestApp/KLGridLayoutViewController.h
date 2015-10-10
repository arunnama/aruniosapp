//
//  KLGridLayoutControllerViewController.h
//  KLCollectionLayoutsDemo
//
//  Created by Kevin Lundberg on 6/14/14.
//  Copyright (c) 2014 Lundbergsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KLGridLayoutViewController : UICollectionViewController

@property (weak, nonatomic) IBOutlet UILabel *textName;

-(NSMutableArray *)getRGBValue:(NSIndexPath *)indexPath;


@end

// Copyright belongs to original author
// http://code4app.net (en) http://code4app.com (cn)
// From the most professional code share website: Code4App.net 

