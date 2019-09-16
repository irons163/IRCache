//
//  IRHCHTTPResponse.h
//  IRCache
//
//  Created by Phil on 2019/9/16.
//  Copyright © 2019 Phil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CocoaHTTPServer/CocoaHTTPServer.h>

NS_ASSUME_NONNULL_BEGIN

@class IRHCHTTPConnection;
@class IRHCDataRequest;

@interface IRHCHTTPResponse : NSObject <HTTPResponse>

+ (instancetype)responseWithConnection:(IRHCHTTPConnection *)connection dataRequest:(IRHCDataRequest *)dataRequest;

@end

NS_ASSUME_NONNULL_END
