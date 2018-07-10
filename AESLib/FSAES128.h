//
//  FSAES128.h
//  phpInterface
//
//  Created by 赵燕超 on 2018/3/5.
//  Copyright © 2018年 yc.test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FSAES128 : NSObject


/**
 加密_Base64

 @param string 需要加密的string
 @param key 加密的key
 @param iv 加密的iv
 @return 加密后的字符串
 */
+ (NSString *)AES128_HEX_EncryptStrig:(NSString *)string key:(NSString *)key iv:(NSString *)iv;

/**
 解密_Base64

 @param string 加密的字符串
 @param key 解密的key
 @param iv 解密的iv
 @return 解密后的内容
 */
+ (NSString *)AES128_HEX_DecryptString:(NSString *)string key:(NSString *)key iv:(NSString *)iv;


/**
 *  加密_Base64
 *
 *  @param string 需要加密的string
 *  @param key 加密的key
    @param iv  加密的iv
 *  @return 加密后的字符串
 */
+ (NSString *)AES128_Base64_EncryptStrig:(NSString *)string key:(NSString *)key iv:(NSString *)iv;

/**
 *  解密_Base64
 *
 *  @param string 加密的字符串
 *  @param key 解密的key
 *  @param iv  解密的iv
 *  @return 解密后的内容
 */
+ (NSString *)AES128_Base64_DecryptString:(NSString *)string key:(NSString *)key iv:(NSString *)iv;


@end
