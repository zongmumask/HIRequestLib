//
//  TFBRequestManager.m
//  TFBRequestTest
//
//  Created by singers on 2019/8/6.
//  Copyright © 2019 singlers. All rights reserved.
//

#import "HIRequestManager.h"
#import "GMWebSSL.h"
#import <openssl/ssl.h>
#import <openssl/evp.h>

@interface HIRequestManager ()

@end

@implementation HIRequestManager

+ (instancetype)sharedInstance
{
    static HIRequestManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[HIRequestManager alloc] init];
    });
    return sharedInstance;
}

+ (FBLPromise *)fetch
{
    return [FBLPromise onQueue:dispatch_get_global_queue(0, 0) do:^id _Nullable{
        [GMWebSSL GMWebInit];
        
        NSInteger test_port = 443;
        NSInteger test_pstatus_code = 0;
        NSString* test_hostname = @"ebssec.boc.cn";
        NSString* test_uri = @"/";
        NSArray*test_http_header = NULL;
        NSString* header = @"";
        NSInteger test_content_length = header.length;
        NSData* post_content_data = NULL;
        NSArray *response_header;
        NSData *response;
        
        [GMWebSSL GMWebInit];
        [GMWebSSL GMWebPost:test_port withHostName:test_hostname withUri:test_uri withHttpHeader:test_http_header
            withPostContentData:(NSData*) post_content_data withContentLength:&test_content_length withStatusCode:&test_pstatus_code withResponseHeader:&response_header withResponse:&response];
        return nil;
    }];
}

+ (NSString *)hashWithString:(NSString *)plaintext
{
    if (!plaintext || plaintext.length == 0) {
        return nil;
    }

    const EVP_MD* md = EVP_sm3();
    EVP_MD_CTX* ctx  = EVP_MD_CTX_new();

    unsigned char hash_result[32] = {0};
    const char *cString = [plaintext cStringUsingEncoding:NSUTF8StringEncoding];
    EVP_DigestInit_ex(ctx, md, NULL);
    EVP_DigestUpdate(ctx, cString, strlen(cString));
    EVP_DigestFinal_ex(ctx, hash_result, NULL);

    EVP_MD_CTX_free(ctx);

    char *tmp = OPENSSL_buf2hexstr(hash_result, 32);
    NSString *tmpHex = [NSString stringWithCString:tmp encoding:NSUTF8StringEncoding];
    tmpHex = [tmpHex stringByReplacingOccurrencesOfString:@":" withString:@""];
    OPENSSL_free(tmp);

    return tmpHex;
}

@end
