//
//  NSData+AES128.h
//  phpInterface
//
//  Created by 赵燕超 on 2018/3/5.
//  Copyright © 2018年 yc.test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (AES128)

/**
 *  加密
 *
 *  @param key 公钥
 *  @param iv  偏移量
 *
 *  @return 加密之后的NSData
 */
- (NSData *)AES128EncryptWithKey:(NSString *)key iv:(NSString *)iv;
/**
 *  解密
 *
 *  @param key 公钥
 *  @param iv  偏移量
 *
 *  @return 解密之后的NSData
 */
- (NSData *)AES128DecryptWithKey:(NSString *)key iv:(NSString *)iv;


@end
