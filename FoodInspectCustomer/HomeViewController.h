//
//  HomeViewController.h
//  FoodInspectCustomer
//
//  Created by EastFish on 14/10/28.
//  Copyright (c) 2014年 EastFish. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "MLTableAlert.h"

@interface HomeViewController : UIViewController


@property (strong, nonatomic) MLTableAlert *alert;

@property (nonatomic, strong) IBOutlet UITextField *rowsNumField;
@property (nonatomic, strong) IBOutlet UILabel *resultLabel;

//单位列表
@property (readwrite, nonatomic, strong) NSArray *companys;

-(IBAction)showTableAlert:(id)sender;

@end
