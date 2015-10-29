//
//  OneCategoryItemsCollectionViewController.m
//  WBNIOS
//
//  Created by Synergy on 24/10/15.
//  Copyright (c) 2015 ArunApp. All rights reserved.
//

#import "applicationStubData.h"
#import "OneCategoryItemsCollectionViewController.h"
#import "OneCategoryCell.h";


@interface OneCategoryItemsCollectionViewController ()

@end

@implementation OneCategoryItemsCollectionViewController

static NSString * const reuseIdentifier = @"oneCatCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Hello View controller of Category List");
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
  //  // Register cell classes
  //  [self.collectionView registerClass:[OneCategoryCell class] forCellWithReuseIdentifier:@"oneCatCell"];
    
    _oneCategoryList =  [applicationStubData getListOfSelectedCategory:@"Cars"];
    
    
    
  //  [self.collectionView registerClass:[OneCategoryCell class] forCellWithReuseIdentifier:@"arun"];
    
    
    [self.collectionView setBackgroundColor:[UIColor lightGrayColor]];
    
    
    
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

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    NSLog(@"Hello Number of sections");
#warning Incomplete method implementation -- Return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete method implementation -- Return the number of items in the section
    return [_oneCategoryList count];
   // return 1000;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    OneCategoryCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    
   // [cell.backgroundColor [UIColor *brownColor]];
    
     cell.backgroundColor = [UIColor whiteColor];
    
    
    NSDictionary *categoryName  = [_oneCategoryList objectAtIndex:indexPath.row];
    NSString *categoryNameString =[categoryName valueForKey:@"name"];
    
    NSString *categoryDesc =[categoryName valueForKey:@"desc"];
    
    
    
    [cell.oneCategoryName setTextColor:[UIColor blackColor]];
    [cell.oneCategoryName setText:categoryNameString];
    [cell.oneCategoryDesc setText:categoryDesc];

   // [cell.oneCategoryDesc setText:@"Hello Desc"];
    [cell.oneCategoryDesc setBackgroundColor:[UIColor whiteColor]];
    
    
    UIImage *image;
    
    if ([indexPath row] % 2)
        image = [UIImage imageNamed:@"car2.jpeg"];
    else
        image = [UIImage imageNamed:@"car3.jpeg"];
    
    cell.oneCategoryImage.image = image;
    
   
    
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
