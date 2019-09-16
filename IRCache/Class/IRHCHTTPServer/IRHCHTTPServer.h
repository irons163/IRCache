//
//  IRHCHTTPServer.h
//  IRCache
//
//  Created by Phil on 2019/9/16.
//  Copyright © 2019 Phil. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface IRHCHTTPServer : NSObject

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

+ (instancetype)httpServer;

@property (nonatomic, assign, readonly) BOOL running;

@property (nonatomic, assign, readonly) NSInteger listeningPort;

- (void)start:(NSError **)error;
- (void)stop;

@end

NS_ASSUME_NONNULL_END
