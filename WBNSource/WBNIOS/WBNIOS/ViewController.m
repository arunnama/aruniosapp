//
//  ViewController.m
//  WBNIOS
//
//  Created by Synergy on 22/10/15.
//  Copyright (c) 2015 ArunApp. All rights reserved.
//


#import "ViewController.h"
#import "CategoryCell.h"
#import "applicationStubData.h"
#import "CatergoryCVLayout.h"
#import "OneCategoryItemsCollectionViewController.h"


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        
    [self.collectionView registerClass:[CategoryCell class] forCellWithReuseIdentifier:@"Hello"];
    
    
    [self.collectionView setBackgroundColor:[UIColor whiteColor]];
    
   // [_homePageNavigationBar setBackgroundColor:[UIColor redColor]];
   //[[self navigationController] setNavigationBarHidden:NO animated:NO];
    
    
   _categoriesList =  [applicationStubData getCategoriesList];
    
    
    self.layout.numberOfItemsPerLine = 2;
    self.layout.aspectRatio = 1;
    self.layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    self.layout.interitemSpacing = 18;
    self.layout.lineSpacing = 18;
    
    
    
    UIColor *blueColour = [UIColor colorWithRed:44.0f/255.0f green:62.0f/255.0f blue:80.0f/255.0f alpha:1.0f];
    
    self.navigationController.toolbarHidden = NO;
    self.navigationController.navigationBar.barTintColor = blueColour;
    self.navigationController.toolbar.barTintColor = blueColour;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    self.scrollCoordinator = [[JDFPeekabooCoordinator alloc] init];
    self.scrollCoordinator.scrollView = self.collectionView;
    self.scrollCoordinator.topView = self.navigationController.navigationBar;
    self.scrollCoordinator.topViewMinimisedHeight = 20.0f;
    self.scrollCoordinator.bottomView = self.navigationController.toolbar;
    
    self.navigationItem.title = @"What? Best Now!";
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    
    UIButton *searchButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [searchButton setImage:[UIImage imageNamed:@"searchIcon"] forState:UIControlStateNormal];
    searchButton.frame = CGRectMake(0.0f, 0.0f, 25.0f, 25.0f);
    
  //  UIBarButtonItem *searchBarButton = [[UIBarButtonItem alloc] initWithCustomView:searchButton];
  //  self.navigationItem.rightBarButtonItem = searchBarButton;
    
    
   // UIBarButtonItem *searchBarItem = [[UIBarButtonItem alloc] initWithCustomView:_searchBar];
   // self.navigationItem.rightBarButtonItem = searchBarItem;
    
    
    //[self.navigationController setNavigationBarHidden: YES animated: NO];
    
    
    
    
   // self.navigationItem.rightBarButtonItem set


    
    
    
    
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"];
    
    
    
    
}


- (CatergoryCVLayout *)layout
{
    
    NSLog(@"%s", __PRETTY_FUNCTION__);
    return (id)self.collectionView.collectionViewLayout;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.scrollCoordinator disable];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.scrollCoordinator enable];
}

#pragma mark - UICollectionView Datasource
- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section;
{
    return [_categoriesList count];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"Hello cell");
    
    CategoryCell* newCell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"Hello"forIndexPath:indexPath];
  //  CategoryCell* cell = (CategoryCell*) cv;
    
    
    newCell.backgroundColor = [UIColor brownColor];
    [newCell.lblArun setTextColor:[UIColor whiteColor]];
    [newCell.lblArun setText:@"Sample"];
   
    NSDictionary *categoryName  = [_categoriesList objectAtIndex:indexPath.row];
    NSString *categoryNameString =[categoryName valueForKey:@"name"];
    [newCell.lblArun setText:categoryNameString];
    
    
    
    
    
    
    
    return newCell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Hello didSelectItemAtIndexPath");
    
    
  //  self.oneCategoryList = [[OneCategoryItemsCollectionViewController alloc] init];
    
    // self..objIdLabel.text = [[self.objArray objectAtIndex:indexPath.row] objId];
    
    OneCategoryItemsCollectionViewController* viewController = [[OneCategoryItemsCollectionViewController alloc] init];
   
    
   // [self.navigationController pushViewController:viewController animated:YES];
    
     [self performSegueWithIdentifier:@"goToOneCategory" sender:self];
    
    NSLog(@"End of navigation Controller");
}



- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        
        UICollectionReusableView *reusableview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
        
        if (reusableview==nil) {
            reusableview=[[UICollectionReusableView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
        }
        
        UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
        label.text=[NSString stringWithFormat:@"Recipe Group #%li", indexPath.section + 1];
        [reusableview addSubview:label];
        return reusableview;
    }
    return nil;
}



- (IBAction)tapped:(UITapGestureRecognizer *)gesture {
    
    CGPoint tapLocation = [gesture locationInView:self.collectionView];
    NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:tapLocation];
    if (indexPath) {
        
        
//        
        
//        self.pamphlet = [pamphlet_Array objectAtIndex:indexPath.item]
        
//        NSLog(@"Selected pamphlet: %@", self.pamphlet);
        
        [self performSegueWithIdentifier:@"goToOneCategory" sender:self];
        
    }
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:


(id)sender {
    
    
    NSLog(@"Hello Segueee");
    if ([segue.identifier isEqualToString:@"showPhotoAlbum"]) {
        NSLog(@"Prepare for Segue to load Specific Photo Album");
        NSLog(@"User Selected this cell or the name of the title in the cell which comes from a NSDictionary =>");
        
        
        self.navigationItem.backBarButtonItem.title = @"Back";
        // EXAMPLE NSLOG TO SHOW =>  User Selected - Album Name
        // Where album name is actually the album name grabbed form the server based on the selected row
    }
}












@end
