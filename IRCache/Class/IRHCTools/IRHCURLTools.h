//
//  IRHCURLTools.h
//  IRCache
//
//  Created by Phil on 2019/9/16.
//  Copyright © 2019 Phil. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface IRHCURLTools : NSObject

+ (NSString *)URLEncode:(NSString *)URLString;
+ (NSString *)URLDecode:(NSString *)URLString;

@end

NS_ASSUME_NONNULL_END
