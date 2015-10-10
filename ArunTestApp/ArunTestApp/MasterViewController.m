//
//  MasterViewController.m
//  ArunTestApp
//
//  Created by Synergy on 21/9/15.
//  Copyright (c) 2015 ArunTesting. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"


@interface MasterViewController ()

@property NSMutableArray *objects;
@property (nonatomic, strong) NSMutableData *responseData;

@property (nonatomic,strong)NSMutableDictionary *nameValue;

@property (nonatomic,strong)NSMutableDictionary *subResult;

@end

@implementation MasterViewController

@synthesize responseData = _responseData;
@synthesize nameValue = _nameValue;
@synthesize subResult = _subResult;

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //self.navigationItem.leftBarButtonItem = self.editButtonItem;

   // UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
   // self.navigationItem.rightBarButtonItem = addButton;
    
    NSLog(@"viewdidload");
    self.responseData = [NSMutableData data];
    NSURLRequest *request = [NSURLRequest requestWithURL:
                             [NSURL URLWithString:@"https://api.meetup.com/2/groups?lat=51.509980&lon=-0.133700&page=20&key=1f5718c16a7fb3a5452f45193232"]];
    [[NSURLConnection alloc] initWithRequest:request delegate:self];


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
    
    NSLog(@"Succeeded! Received %lu bytes of data",(unsigned long)[self.responseData length]);
    
    // convert to JSON
    NSError *myError = nil;
    NSDictionary *res = [NSJSONSerialization JSONObjectWithData:self.responseData options:NSJSONReadingMutableLeaves error:&myError];
    
    // show all values
    for(id key in res) {
        
        id value = [res objectForKey:key];
        
        NSString *keyAsString = (NSString *)key;
        NSString *valueAsString = (NSString *)value;
        
        NSLog(@"key: %@", keyAsString);
        NSLog(@"value: %@", valueAsString);
    }
    
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
    
    [self.tableView reloadData];
    
}



- (void)viewDidUnload {
    [super viewDidUnload];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    NSLog(@"hello sender");
    
    [self.objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = self.objects[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"table view valuesss");
    NSLog(@"Returning the value%lu",(unsigned long)[_subResult count]);
    return [_subResult count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSDate *object = self.objects[indexPath.row];
    cell.textLabel.text = [object description];
    

    
    
   // NSArray *userData = [NSJSONSerialization JSONObjectWithData:_responseData options:NSJSONReadingAllowFragments error:nil];
    
    NSMutableArray *creditCards = [NSMutableArray array];
    for (NSMutableArray *user in _subResult) {
        cell.textLabel.text = [user valueForKey:@"name"];
        NSLog(@"Value in subresutl testing %@",[user valueForKey:@"name"]);
    }
    
    
    
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

@end
