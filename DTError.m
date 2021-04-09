//
//  DTError.m
//  URWorkClient
//
//  Created by DarkAngel on 16/3/22.
//  Copyright © 2016年 优鲜集. All rights reserved.
//

#import "DTError.h"

@implementation DTError
/*!
 *  创建一个DTError实例
 *
 *  @param errorCode 错误类型
 *  @param errorMsg  错误信息
 *
 *  @return DTError对象
 */
+ (instancetype)errorWithType:(DTErrorCode)errorCode errorMsg:(nullable NSString *)errorMsg
{
    return [self errorWithType:errorCode errorMsg:errorMsg userInfo:nil];
}
/*!
 *  工厂方法返回实例
 *
 *  @param errorCode 错误码
 *  @param errorMsg  错误信息
 *  @param userInfo  其他信息
 *
 *  @return DTError对象
 */
+ (instancetype)errorWithType:(DTErrorCode)errorCode errorMsg:(NSString *)errorMsg userInfo:(nullable NSDictionary *)userInfo
{
    DTError *error = [[DTError alloc] init];
    error.errorCode = errorCode;
    error.errorMsg = [errorMsg isEqualToString:@"error"] ? NSLocalizedString(UWServerErrorMessage, nil) : errorMsg;
    error.userInfo = userInfo;
    return error;
}

/*!
 *  用NSError对象创建一个DTError对象
 *
 *  @param error NSError对象
 *
 *  @return DTError对象
 */
+ (instancetype)errorWithNSError:(NSError *)error
{
    return [self errorWithType:error.code errorMsg:error.localizedDescription];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"ErrorCode: %@, ErrorMsg: %@, UserInfo: %@", @(self.errorCode), self.errorMsg, self.userInfo];
}

@end
