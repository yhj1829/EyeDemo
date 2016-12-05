//
//  NetworkTool.h
//  EyeDemo
//
//  Created by 阳光 on 16/12/3.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SuccessBlock)(id responseObj);

typedef void(^FailureBlock)(NSError *error);

@interface NetworkTool : NSObject

//typedef void(^SuccessBlock)(AFHTTPRequestSerializer *task,id responseObject);
//
//typedef void(^FailureBlock)(AFHTTPRequestSerializer *task,NSError *error);

+(instancetype)shareInstance;

+(void)requestDataByURL:(NSString *)url parameters:(NSDictionary *)paraDic success:(SuccessBlock)success failure:(FailureBlock)failure;

@end
