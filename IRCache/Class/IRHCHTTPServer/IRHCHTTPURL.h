//
//  IRHCHTTPURL.h
//  IRCache
//
//  Created by Phil on 2019/9/16.
//  Copyright © 2019 Phil. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface IRHCHTTPURL : NSObject

+ (IRHCHTTPURL *)URLWithURIString:(NSString *)URIString;
+ (IRHCHTTPURL *)URLWithOriginalURLString:(NSString *)originalURLString;

@property (nonatomic, copy, readonly) NSString * originalURLString;
@property (nonatomic, copy, readonly) NSString * proxyURLString;

@property (nonatomic, assign, readonly) NSInteger listeningPort;

@end

NS_ASSUME_NONNULL_END
