//
//  ListOfItemsTVController.m
//  ArunTestApp
//
//  Created by Synergy on 29/9/15.
//  Copyright (c) 2015 ArunTesting. All rights reserved.
//

#import "ListOfItemsTVController.h"
#import "TestTableViewCell.h"

@interface ListOfItemsTVController ()



@end

@implementation ListOfItemsTVController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.myTableView.dataSource = self;
    self.myTableView.delegate=self;
    
    
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
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    NSLog(@"Number of rows %d",4);
    return 4;
    
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tblView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"Cell  for the indexPath :%ld",(long)indexPath.row);
    
    static NSString *simpleTableIdentifier = @"MyCell";
    
    TestTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        
        NSLog(@"Whats happeing here");
        cell = [[TestTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        //[cell setNeedsDisplay];
    }
    
    cell.textTitle.text = @":Ravi:";
    cell.textTitleDesc.text = @"Arun";
    
    
    /*cell.textTitle.text = @"Simple Label";
    //set the lable font
      cell.textTitle.font = [UIFont boldSystemFontOfSize:16.0f];
    
    //se the text alignment
      cell.textTitle.textAlignment =  NSTextAlignmentCenter;
    //se the border color and width
      cell.textTitle.layer.borderColor = [UIColor blackColor].CGColor;
      cell.textTitle.layer.borderWidth = 1.0;
    
    cell.textTitle.text = @"Testing ";
    cell.textTitleDesc.text = @"Testing Desc";
  //  cell.TitleImageView.image = [UIImage uiImage]
    [self.tableView setBackgroundView:nil];
    [self.tableView setBackgroundColor:[UIColor clearColor]];*/
    return cell;
   // cell = [tableView dequeueReusableCellWithIdentifier:@"Item" forIndexPath:indexPath];
   
    
    
    
    
    // NSArray *userData = [NSJSONSerialization JSONObjectWithData:_responseData options:NSJSONReadingAllowFragments error:nil];
    
    /*
        NSMutableArray *brokenCars = [NSMutableArray arrayWithObjects:
                                  @"Audi A6", @"BMW Z3",
                                  @"Audi Quattro", @"Audi TT", nil];
    
        cell.textLabel.text =brokenCars[indexPath.row];
    
    return cell;
     */
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    
    NSLog(@"Calling did select");
    
    
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"viewFullDetails"])
    {
       // NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
        
        // load the image, to prevent it from being cached we use 'initWithContentsOfFile'
        // NSString *imageNameToLoad = [NSString stringWithFormat:@"%ld_full", (long)selectedIndexPath.row];
        // UIImage *image = [UIImage imageNamed:imageNameToLoad];
        
        
        
        // DetailViewControllerNewViewController *detailViewController = segue.destinationViewController;
        NSLog(@"Calling Segui full details screen");
        
        
        DetailViewControllerNewViewController *detailViewController = segue.destinationViewController;
        [detailViewController loadData:@"HelloDataNew"];
        
        
        
        
    }
}


@end
