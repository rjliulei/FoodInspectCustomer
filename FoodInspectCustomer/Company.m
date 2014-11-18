//
//  Company.m
//  FoodInspectCustomer
//
//  Created by apple on 14-11-14.
//  Copyright (c) 2014年 EastFish. All rights reserved.
//

#import "Company.h"

@implementation Company

static int const JSON_TYPE_COMPANYS = 1;
static int const JSON_TYPE_COMPANYS_NEARBY = 2;

static NSString * const JSON_KEY_COMPANY_LIST = @"companies";
static NSString * const JSON_KEY_COMPANY_ID = @"companyId";
static NSString * const JSON_KEY_COMPANY_NAME = @"companyName";

static NSString * const JSON_KEY_COMPANY_NEARBY_LIST = @"rows";
static NSString * const JSON_KEY_COMPANY_NEARBY_ID = @"companyid";
static NSString * const JSON_KEY_COMPANY_NEARBY_NAME = @"qymc";
static NSString * const JSON_KEY_COMPANY_NEARBY_LAT = @"jpswd";
static NSString * const JSON_KEY_COMPANY_NEARBY_LNG = @"gpwjd";
static NSString * const JSON_KEY_COMPANY_NEARBY_DIRECTION = @"gpsfwj";
static NSString * const JSON_KEY_COMPANY_NEARBY_DISTANCE = @"jl";

/**获取单位列表 参数：单位名称 ＋ pageindex*/
static NSString * const DAO_URL_GET_COMPANY_LIST = @"ServiceAction!getCompanyList.action";
static NSString * const PARAM_COMPANY_NAME = @"m.qymc=";
static NSString * const PARAM_PAGE_INDEX = @"&m.page=";

/**检索附近单位*/
static NSString * const URL_DAO_SEARCH_AROUND = @"ServiceAction!searchNearCompany.action";
static NSString * const PARAM_SEARCH_AROUND_LAT = @"m.lat=";
static NSString * const PARAM_SEARCH_AROUND_LNG = @"&m.lng=";


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

- (instancetype)initWithAttributes:(NSDictionary *)attributes
                              type:(int)type
{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    switch (type) {
        case JSON_TYPE_COMPANYS:
            self.companyId = [attributes valueForKeyPath:JSON_KEY_COMPANY_ID];
            self.companyName = [attributes valueForKeyPath:JSON_KEY_COMPANY_NAME];
            break;
        case JSON_TYPE_COMPANYS_NEARBY:
            
            self.companyId = [attributes valueForKeyPath:JSON_KEY_COMPANY_NEARBY_ID];
            self.companyName = [attributes valueForKeyPath:JSON_KEY_COMPANY_NEARBY_NAME];
            self.direction = [attributes valueForKeyPath:JSON_KEY_COMPANY_NEARBY_DIRECTION];
            self.distance = (int)[[attributes valueForKeyPath:JSON_KEY_COMPANY_NEARBY_DISTANCE] integerValue];
            self.latitude = (double)[[attributes valueForKeyPath:JSON_KEY_COMPANY_NEARBY_LAT] doubleValue];
            self.longitude = (double)[[attributes valueForKeyPath:JSON_KEY_COMPANY_NEARBY_LNG] doubleValue];

            break;
            
        default:
            break;
    }
    
    return self;
}


/***获取商家列表*/
+ (NSURLSessionDataTask *)globalCompanysWithBlock:(void (^)(NSArray *posts, NSError *error))block
{
    return [[AFAppAPIClient sharedClient] GET:DAO_URL_GET_COMPANY_LIST parameters:nil success:^(NSURLSessionDataTask * __unused task, id JSON) {
        NSArray *companysFromResponse = [JSON valueForKeyPath:@"data"];
        NSMutableArray *mutableCompanys = [NSMutableArray arrayWithCapacity:[companysFromResponse count]];
        for (NSDictionary *attributes in companysFromResponse) {
            Company *company = [[Company alloc] initWithAttributes:attributes type:JSON_TYPE_COMPANYS];
            [mutableCompanys addObject:company];
        }
        
        if (block) {
            block([NSArray arrayWithArray:mutableCompanys], nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block([NSArray array], error);
        }
    }];

}
@end
