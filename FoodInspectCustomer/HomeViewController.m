//
//  HomeViewController.m
//  FoodInspectCustomer
//
//  Created by EastFish on 14/10/28.
//  Copyright (c) 2014年 EastFish. All rights reserved.
//

#import "HomeViewController.h"
#import "Company.h"
#import "UIAlertView+AFNetworking.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)reload:(__unused id)sender {
    
    NSURLSessionTask *task = [Company globalCompanysWithBlock:^(NSArray *posts, NSError *error) {
        if (!error) {
            self.companys = posts;
            [self initAlartView];
        }
    }];
    
    [UIAlertView showAlertViewForTaskWithErrorOnCompletion:task delegate:nil];
}

-(void)initAlartView{

    // create the alert
    self.alert = [MLTableAlert tableAlertWithTitle:@"Choose an option..." cancelButtonTitle:@"Cancel" numberOfRows:^NSInteger (NSInteger section)
                  {
                      
                      return (NSInteger)[self.companys count];
                      
                      //                      if (self.rowsNumField.text == nil || [self.rowsNumField.text length] == 0 || [self.rowsNumField.text isEqualToString:@"0"])
                      //                          return 1;
                      //                      else
                      //                          return [self.rowsNumField.text integerValue];
                  }
                                          andCells:^UITableViewCell* (MLTableAlert *anAlert, NSIndexPath *indexPath)
                  {
                      static NSString *CellIdentifier = @"CellIdentifier";
                      UITableViewCell *cell = [anAlert.table dequeueReusableCellWithIdentifier:CellIdentifier];
                      if (cell == nil)
                          cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
                      
                      Company* company = [self.companys objectAtIndex:(NSUInteger)indexPath.row];
                      
                      cell.textLabel.text = [NSString stringWithFormat:@"%@", company.companyName];
                      
                      return cell;
                  }];
    
    // Setting custom alert height
    self.alert.height = 350;
    
    // configure actions to perform
    [self.alert configureSelectionBlock:^(NSIndexPath *selectedIndex){
        self.resultLabel.text = [NSString stringWithFormat:@"Selected Index\nSection: %d Row: %d", selectedIndex.section, selectedIndex.row];
    } andCompletionBlock:^{
        self.resultLabel.text = @"Cancel Button Pressed\nNo Cells Selected";
    }];
    
    // show the alert
    [self.alert show];
    
}

-(IBAction)showTableAlert:(id)sender
{
//    [self reload:nil];
    [Company postJson];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
