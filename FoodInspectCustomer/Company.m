//
//  Company.m
//  FoodInspectCustomer
//
//  Created by apple on 14-11-14.
//  Copyright (c) 2014年 EastFish. All rights reserved.
//

#import "Company.h"

@implementation Company

- (id)initWithParameters:(int)newID
            andCompanyId:(NSString *)newCompanyId
          andCompanyName:(NSString *)newCompanyName
            andDirection:(NSString *)nDirection
             andDistance:(int)nDistance
             andLatitude:(double)nLatitude
            andLongitude:(double)nLongitude
{
    Company *n = [[Company alloc] init];
    n._id = newID;
    n.companyId = newCompanyId;
    n.companyName = newCompanyName;
    n.direction = nDirection;
    n.distance = nDistance;
    n.latitude = nLatitude;
    n.longitude = nLongitude;
    return n;
}
@end
