//
//  RequestTool.m
//  EyeDemo
//
//  Created by 阳光 on 16/12/3.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import "RequestTool.h"

@implementation RequestTool

+(void)getShopListDataWithDic:(NSDictionary *)dic success:(void (^)(id))success failure:(void (^)(id))failure
{
    [NetworkTool requestDataByURL:ShopList parameters:dic success:^(id responseObj) {
        
        success(responseObj);
        
    } failure:^(NSError *error) {
        
    }];
}

+(void)getShopListMoreDataWithDic:(NSDictionary *)dic byURL:(NSString *)url success:(void (^)(id))success failure:(void(^)(id))failure
{
    [NetworkTool requestDataByURL:url parameters:dic success:^(id responseObj) {
        
        success(responseObj);
        
    } failure:^(NSError *error) {
        
    }];
}

@end
