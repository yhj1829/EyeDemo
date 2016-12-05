//
//  RequestTool.h
//  EyeDemo
//
//  Created by 阳光 on 16/12/3.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkTool.h"

@interface RequestTool : NSObject

+(void)getShopListDataWithDic:(NSDictionary *)dic success:(void (^)(id))success failure:(void(^)(id))failure;

+(void)getShopListMoreDataWithDic:(NSDictionary *)dic byURL:(NSString *)url success:(void (^)(id))success failure:(void(^)(id))failure;

@end
