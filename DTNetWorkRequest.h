//
//  DTNetWorkRequest.h
//  explicit
//
//  Created by zhangjingfei on 9/4/2021.
//

#import <Foundation/Foundation.h>
#import "DTError.h"
NS_ASSUME_NONNULL_BEGIN

@interface DTNetWorkRequest : NSObject

/************************************************************************
 功能：请求网络JSON数据，返回NSString
 参数：url 请求的网络url
 *************************************************************************/
+ (NSURLSessionDataTask *)POST:(NSString *)URLString
                    parameters:(id)bodys
                       success:(void (^)(id __nullable dataObject))success
                       failure:(void (^)(DTError * __nullable error))failure;

/************************************************************************
 功能：请求网络JSON数据， get 方法
 参数：url 请求的网络url
 *************************************************************************/
+ (NSURLSessionDataTask *)GET:(NSString *)URLString
                    parameters:(id)bodys
                       success:(void (^)(id __nullable dataObject))success
                      failure:(void (^)(DTError * __nullable error))failure;

@end

NS_ASSUME_NONNULL_END
