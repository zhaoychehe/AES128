//
//  FSAES128.m
//  phpInterface
//
//  Created by 赵燕超 on 2018/3/5.
//  Copyright © 2018年 yc.test. All rights reserved.
//

#import "FSAES128.h"
#import "NSData+AES128.h"

@implementation FSAES128

+ (NSString *)AES128_HEX_EncryptStrig:(NSString *)string key:(NSString *)key iv:(NSString *)iv
{
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    NSData *aesData = [data AES128EncryptWithKey:key iv:iv];
    return [FSAES128 convertDataToHexStr:aesData];
}

+ (NSString *)AES128_HEX_DecryptString:(NSString *)string key:(NSString *)key iv:(NSString *)iv
{
    NSData *data  = [FSAES128 convertHexStrToData:string];
    NSData *aesData = [data AES128DecryptWithKey:key iv:iv];
    return [[NSString alloc] initWithData:aesData encoding:NSUTF8StringEncoding];
}

+ (NSString *)AES128_Base64_EncryptStrig:(NSString *)string key:(NSString *)key iv:(NSString *)iv
{
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    NSData *aesData = [data AES128EncryptWithKey:key iv:iv];
    return [aesData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
}

+ (NSString *)AES128_Base64_DecryptString:(NSString *)string key:(NSString *)key iv:(NSString *)iv
{
    
    NSData *data  = [[NSData alloc] initWithBase64EncodedString:string options:NSDataBase64DecodingIgnoreUnknownCharacters];
    NSData *aesData = [data AES128DecryptWithKey:key iv:iv];
    return [[NSString alloc] initWithData:aesData encoding:NSUTF8StringEncoding];
}


//16进制转换为NSData
+ (NSData*)convertHexStrToData:(NSString*)str {
    if (!str || [str length] ==0) {
        return nil;
    }
    
    NSMutableData *hexData = [[NSMutableData alloc]initWithCapacity:[str length]*2];
    NSRange range;
    if ([str length] %2==0) {
        range = NSMakeRange(0,2);
    } else {
        range = NSMakeRange(0,1);
    }
    for (NSInteger i = range.location; i < [str length]; i +=2) {
        unsigned int anInt;
        NSString *hexCharStr = [str substringWithRange:range];
        NSScanner *scanner = [[NSScanner alloc]initWithString:hexCharStr];
        
        [scanner scanHexInt:&anInt];
        NSData *entity = [[NSData alloc]initWithBytes:&anInt length:1];
        [hexData appendData:entity];
        
        range.location+= range.length;
        range.length=2;
    }
    //    NSLog(@"hexdata: %@", hexData);
    return hexData;
}

//NSData转换为16进制
+ (NSString*)convertDataToHexStr:(NSData*)data {
    if (!data || [data length] ==0) {
        return @"";
    }
    NSMutableString *string = [[NSMutableString alloc]initWithCapacity:[data length]/2];
    
    [data enumerateByteRangesUsingBlock:^(const void*bytes,NSRange byteRange,BOOL*stop) {
        unsigned char *dataBytes = (unsigned  char*)bytes;
        for (NSInteger i =0; i < byteRange.length; i++) {
            NSString *hexStr = [NSString stringWithFormat:@"%x", (dataBytes[i]) & 0xff];
            if ([hexStr length] ==2) {
                [string appendString:hexStr];
            } else {
                [string appendFormat:@"0%@", hexStr];
            }
        }
    }];
    
    return string;
}

@end
