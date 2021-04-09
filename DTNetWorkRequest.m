//
//  DTNetWorkRequest.m
//  explicit
//
//  Created by zhangjingfei on 9/4/2021.
//

#import "DTNetWorkRequest.h"
#import "DTError.h"

@implementation DTNetWorkRequest

/************************************************************************
 功能：请求网络JSON数据，返回NSString
 参数：url 请求的网络url
 *************************************************************************/
+ (NSURLSessionDataTask *)POST:(NSString *)URLString
                    parameters:(id)bodys
                       success:(void (^)(id __nullable dataObject))success
                       failure:(void (^)(DTError * __nullable error))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 10.f;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    [manager.operationQueue cancelAllOperations];
    
    return [manager POST:URLString parameters:bodys progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
    {
        [Tool jsonTostring:responseObject];
        NSDictionary *retDict = responseObject;
        if ([retDict[@"code"] integerValue] == 1)
        {
            if (success)
            {
                success(retDict[@"data"]);
            }
        }
        else
        {
            if (failure)
            {
                failure([DTError errorWithType:[retDict[@"code"] integerValue] errorMsg:retDict[@"message"] userInfo:retDict]);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure)
        {
            DTError *err = [DTError errorWithNSError:error];
            failure(err);
        }
    }];
}

/************************************************************************
 功能：请求网络JSON数据， get 方法
 参数：url 请求的网络url
 *************************************************************************/
+ (NSURLSessionDataTask *)GET:(NSString *)URLString
                    parameters:(id)bodys
                       success:(void (^)(id __nullable dataObject))success
                       failure:(void (^)(DTError * __nullable error))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 10.f;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    [manager.operationQueue cancelAllOperations];
   
    return [manager GET:URLString parameters:bodys progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
    {
        [Tool jsonTostring:responseObject];
        NSDictionary *retDict = responseObject;
        if ([retDict[@"code"] integerValue] == 1)
        {
            if (success)
            {
                success(retDict[@"data"]);
            }
        }
        else
        {
            if (failure)
            {
                failure([DTError errorWithType:[retDict[@"code"] integerValue] errorMsg:retDict[@"message"] userInfo:retDict]);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure)
        {
            DTError *err = [DTError errorWithNSError:error];
            failure(err);
        }
    }];
}
@end
