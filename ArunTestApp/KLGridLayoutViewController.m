//
//  KLGridLayoutControllerViewController.m
//  KLCollectionLayoutsDemo
//
//  Created by Kevin Lundberg on 6/14/14.
//  Copyright (c) 2014 Lundbergsoft. All rights reserved.
//

#import "KLGridLayoutViewController.h"
#import "KRLCollectionViewGridLayout.h"
#import "DetailViewControllerNewViewController.h"
#import "ListOfItemsTVController.h"

@interface KLGridLayoutViewController () <UIActionSheetDelegate>

@property NSMutableArray *objects;
@property (nonatomic, strong) NSMutableData *responseData;

@property (nonatomic,strong)NSMutableDictionary *nameValue;

@property (nonatomic,strong)NSMutableDictionary *subResult;

@property NSMutableArray *finalResult;



@end



@implementation KLGridLayoutViewController

UIActivityIndicatorView *activityIndicator;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (KRLCollectionViewGridLayout *)layout
{
    
    
    return (id)self.collectionView.collectionViewLayout;
    
}

- (IBAction)changeColumnsTapped:(id)sender {
    [[[UIActionSheet alloc] initWithTitle:@"Choose how many columns"
                                 delegate:self
                        cancelButtonTitle:nil
                   destructiveButtonTitle:nil
                        otherButtonTitles:@"1",@"2",@"3",@"4",@"5", nil]
     showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    self.layout.numberOfItemsPerLine = [[actionSheet buttonTitleAtIndex:buttonIndex] integerValue];
    //self.layout.numberOfItemsPerLine = 2;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    

    self.layout.numberOfItemsPerLine = 2;
    self.layout.aspectRatio = 1;
    self.layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    self.layout.interitemSpacing = 10;
    self.layout.lineSpacing = 10;

    self.showLoadingInidicator;
    
    
    NSLog(@"viewdidload");
    self.responseData = [NSMutableData data];
    NSURLRequest *request = [NSURLRequest requestWithURL:
                             [NSURL URLWithString:@"http://localhost/service.php"]];
    [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    
    
    
}

-(void) showLoadingInidicator{
    
    activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    activityIndicator.center = CGPointMake(self.view.frame.size.width / 2.0, self.view.frame.size.height / 2.0);
    [self.view addSubview: activityIndicator];
    
    [activityIndicator startAnimating];
    
}


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSLog(@"didReceiveResponse");
    [self.responseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [self.responseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"didFailWithError");
    NSLog(@"[NSString stringWithFormat:Connection failed: %@", [error description]);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"connectionDidFinishLoading");
    
    [activityIndicator stopAnimating];
    
    
    NSLog(@"Succeeded! Received %lu bytes of data",(unsigned long)[self.responseData length]);
    
    // convert to JSON
    NSError *myError = nil;
    NSDictionary *res = [NSJSONSerialization JSONObjectWithData:self.responseData options:NSJSONReadingMutableLeaves error:&myError];
    
    // show all values

        NSArray *valueArray = [res objectForKey:@"categories"];
        
        
        _finalResult = [NSMutableArray array];

    
         for(id categoryObj in valueArray) {
             
             
             NSLog(@"Value in name%@",[categoryObj
                                       objectForKey:@"name"]);
             
             
             
             _subResult = [[NSMutableDictionary alloc] init];
             
             [_subResult setObject:[categoryObj
                                    objectForKey:@"name"] forKey:@"name"];
             
             
           
             
             
             NSLog(@"Value in name---------%@",[_subResult
                                       objectForKey:@"name"]);
             

             
             
//             [_subResult setValue:[categoryObj
//                                   objectForKey:@"name"] forKey:@"name"];
             
             
             NSLog(@"Result for the subresult");
             
            // _finalResult = [[NSMutableArray alloc] init];

             
             
             [_finalResult addObject:_subResult];
             
            
            
             
             
         }
    
    NSLog(@"Object value subrsult%@",[_subResult valueForKey:@"name"]);
    
    
   
    
    
    
    
  
    /*
    // extract specific value...
    NSDictionary *results = [res objectForKey:@"results"];
    
    
    for (NSDictionary *result in results) {
        _subResult = [result objectForKey:@"topics"];
        
        NSLog(@"Subresult value is : %@", _subResult);
    }
    
    
    
    for (NSDictionary *name in _subResult) {
        _nameValue = [name objectForKey:@"name"];
        NSLog(@"name Value  %@", _nameValue);
    }
     
    */
    
    
    
    
    [self.collectionView reloadData];
    
    
    
}



- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 2;
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];

    
    
    NSMutableArray *rgbValues = [self getRGBValue :indexPath];
    
    
    float redColor=[[rgbValues objectAtIndex:0] floatValue];
    float greenColor=[[rgbValues objectAtIndex:1] floatValue];
    float blueColor=[[rgbValues objectAtIndex:2] floatValue];
    
    
    if (indexPath.section % 2 == 1) {
        cell.contentView.backgroundColor =
        [UIColor colorWithRed:redColor green:greenColor blue:blueColor alpha:1];
    } else {
        cell.contentView.backgroundColor =  [UIColor colorWithRed:redColor green:greenColor blue:blueColor alpha:1];
    }
    
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, cell.bounds.size.width, 40)];
    title.tag = 200;
   // title.text=@"Text App";
    
   // title.textColor= [UIColor colorWithRed:(160/255.0) green:(97/255.0) blue:(5/255.0)];
    
   // title.textColor = UIColor(160.0, 97.0, 5.0, 1.0);
    
    // 255,127,0
    
    

    
  //  NSMutableArray *creditCards = [NSMutableArray array];
   // NSLog(@"Sub result is %"+_subResult);
    
    
    
    
   
        
    NSDictionary *categoryName  = [_finalResult objectAtIndex:indexPath.row];
    
    NSLog(@"Arun value in set data for categorey Name %@",[categoryName objectForKey:@"name"]);
    
    for(NSString *key in [categoryName allKeys]) {
        NSLog(@"%@",[categoryName objectForKey:key]);
    }
    
    
    title.text =[categoryName valueForKey:@"name"];
        
        NSLog(@"Value in subresutl testing %@",[categoryName valueForKey:@"name"]);
  
    
    
    [cell.contentView addSubview:title];
     
    
    
    UIImageView *imv = [[UIImageView alloc]initWithFrame:CGRectMake(3,2, 20, 25)];
    imv.image=[UIImage imageNamed:@"appleimg.png"];
    
    NSLog(@"Image from the apple is %@",imv);
    [cell addSubview:imv];
   // [imv release];
    
    
    
    
    return cell;
}

-(NSMutableArray *) getRGBValue : (NSIndexPath *)indexPath{
    
    
    NSMutableArray *rgbValues =nil;
    if(indexPath.row == 1)
    {
    
       rgbValues = [NSMutableArray arrayWithObjects:[NSNumber numberWithFloat:0],[NSNumber numberWithFloat:255] ,[NSNumber numberWithFloat:0] , nil];

        
        
    }
    else{
        
        
        rgbValues = [NSMutableArray arrayWithObjects:[NSNumber numberWithFloat:255],[NSNumber numberWithFloat:255] ,[NSNumber numberWithFloat:0] , nil];
    }
    
    
                                 
    
        
    
    return rgbValues;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    
    
    
}



#pragma mark - Segues




- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"viewDetailsNew"])
    {
        NSIndexPath *selectedIndexPath = [self.collectionView indexPathsForSelectedItems][0];
        
        // load the image, to prevent it from being cached we use 'initWithContentsOfFile'
       // NSString *imageNameToLoad = [NSString stringWithFormat:@"%ld_full", (long)selectedIndexPath.row];
       // UIImage *image = [UIImage imageNamed:imageNameToLoad];
        
       
       // DetailViewControllerNewViewController *detailViewController = segue.destinationViewController;
        
         ListOfItemsTVController *detailViewController = segue.destinationViewController;
       
    }
}


@end

// Copyright belongs to original author
// http://code4app.net (en) http://code4app.com (cn)
// From the most professional code share website: Code4App.net 
