//
//  Company.h
//  FoodInspectCustomer
//
//  Created by apple on 14-11-14.
//  Copyright (c) 2014年 EastFish. All rights reserved.
//

#import <Foundation/Foundation.h>

/**公司类*/
@interface Company : NSObject

@property int _id;
@property (nonatomic,copy) NSString * companyId;//公司id
@property (nonatomic,copy) NSString * companyName;//公司名称
@property (nonatomic,copy) NSString * direction;//公司所在方向
@property int distance;//公司到自身位置的距离
@property double latitude;//公司的纬度
@property double longitude;//公司的经度

- (id)initWithParameters:(int)newID
            andCompanyId:(NSString *)newCompanyId
            andCompanyName:(NSString *)newCompanyName
            andDirection:(NSString *)nDirection
            andDistance:(int)nDistance
            andLatitude:(double)nLatitude
            andLongitude:(double)nLongitude;

@end
