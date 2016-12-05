//
//  NetworkTool.m
//  EyeDemo
//
//  Created by 阳光 on 16/12/3.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import "NetworkTool.h"

@implementation NetworkTool

+(instancetype)shareInstance
{
    static NetworkTool *netWorkTool=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        netWorkTool=[NetworkTool new];
    });
    return netWorkTool;
}

+(void)requestDataByURL:(NSString *)url parameters:(NSDictionary *)paraDic success:(SuccessBlock)success failure:(FailureBlock)failure
{
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"text/html",@"application/json", nil];
    NSLog(@"url--%@ \n paraDic--%@",url,paraDic);
    
    [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];

}

@end
