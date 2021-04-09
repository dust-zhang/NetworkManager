//
//  DTError.h
//  URWorkClient
//
//  Created by DarkAngel on 16/3/22.
//  Copyright © 2016年 优鲜集. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/*!
 *  错误枚举
 */
typedef NS_ENUM(NSInteger, DTErrorCode) {
    /*!
     *  无网络错误
     */
    DTErrorNoNetwork                = NSURLErrorNotConnectedToInternet,
    /*!
     *  网络连接超时
     */
    DTErrorConnectionTimeOut        = NSURLErrorTimedOut,
    /*!
     *  已取消网络连接超时
     */
    DTErrorCancelled                = NSURLErrorCancelled,
    /*!
     *  服务器错误，返回有数据，但是数据无法解析，主动使用
     */
    DTErrorUnkown                   = 1000,
    /*!
     *  Api错误
     */
    DTErrorApiError                 = 999,
    /*!
     *  支付失败
     */
    DTErrorPayFailure               = 3223,
    /*!
     *  需要用户登录
     */
    DTErrorNeedUserLogin            = -2,
    /*!
     *  未入驻或信息不完善
     */
    DTErrorUnenter                  = -5,
    /*!
     *  盈科老用户
     */
    DTErrorOldUser                  = 5,
    /**
     *  请输入图形验证码或验证码已失效
     */
    DTErrorNeedGraphValidateCode    = 6,
    /**
     *  验证码错误
     */
    DTErrorValidateCode             = 7,
    /*!
     *  发送的信息流为空
     */
    DTErrorPostFeedEmpty            = 1001,
    /*!
     *  信息流评论为空
     */
    DTErrorReplyFeedEmpty           = 1002,
    /*!
     *  信息流已被删除
     */
    DTErrorFeedBeDeleted            = -6,
    /*!
     *  上传图片失败
     */
    DTErrorUploadImageFailure       = 1234,
    /*!
     *  无权限
     */
    DTErrorNoPermissions            = -3,
    /*!
     *  已经是圈子成员
     */
    DTErrorGroupMemberAlready       = -4,
    /*!
     *  Wifi认证失效
     */
    DTErrorWifiAuthorizationInvalid = -10,
    /*!
     *  重复信息流
     */
    DTErrorRepeatFeed = -22,
    /*!
    *  服务器端的特殊提示信心
    */
    DTErrorServicesInfo = 400
};

/*!
 *  @author DarkAngel, 16-03-22 16:03:44
 *
 *  通用错误类
 */
@interface DTError : NSObject
/*!
 *  错误类型
 */
@property (nonatomic, assign) DTErrorCode errorCode;
/*!
 *  错误信息
 */
@property (nonatomic, copy, nullable) NSString *errorMsg;
/*!
 *  其他信息
 */
@property (nonatomic, copy, nullable) NSDictionary *userInfo;
/*!
 *  用NSError对象创建一个DTError对象
 *
 *  @param error NSError对象
 *
 *  @return DTError对象
 */
+ (instancetype)errorWithNSError:(nullable NSError *)error;
/*!
 *  创建一个DTError实例
 *
 *  @param errorCode 错误类型
 *  @param errorMsg  错误信息
 *
 *  @return DTError对象
 */
+ (instancetype)errorWithType:(DTErrorCode)errorCode errorMsg:(nullable NSString *)errorMsg;
/*!
 *  工厂方法返回实例
 *
 *  @param errorCode 错误码
 *  @param errorMsg  错误信息
 *  @param userInfo  其他信息
 *
 *  @return DTError对象
 */
+ (instancetype)errorWithType:(DTErrorCode)errorCode errorMsg:(NSString *)errorMsg userInfo:(nullable NSDictionary *)userInfo;

@end

NS_ASSUME_NONNULL_END
