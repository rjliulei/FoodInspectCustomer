//
//  ImpeachViewController.h
//  
//
//  Created by EastFish on 14/10/27.
//
//

#import <UIKit/UIKit.h>
#import "PullTableView.h"

@interface ImpeachViewController : UIViewController<UITableViewDataSource, PullTableViewDelegate>{
    PullTableView *pullTableView;
}


@property (nonatomic, retain) IBOutlet PullTableView *pullTableView;

@end
