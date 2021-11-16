//
//  TFBRequestManager.h
//  TFBRequestTest
//
//  Created by singers on 2019/8/6.
//  Copyright © 2019 singlers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FBLPromises.h"

NS_ASSUME_NONNULL_BEGIN

@interface HIRequestManager : NSObject

+ (NSString *)hashWithString:(NSString *)plaintext;

+ (FBLPromise *)fetch;

@end

NS_ASSUME_NONNULL_END

