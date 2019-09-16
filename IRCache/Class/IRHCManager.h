//
//  IRHCManager.h
//  IRCache
//
//  Created by Phil on 2019/9/16.
//  Copyright © 2019 Phil. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface IRHCManager : NSObject

+ (void)start:(NSError **)error;
+ (void)stop;

+ (NSString *)URLStringWithOriginalURLString:(NSString *)urlString;

@end

NS_ASSUME_NONNULL_END
