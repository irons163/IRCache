//
//  IRHCHTTPRequest.h
//  IRCache
//
//  Created by Phil on 2019/9/16.
//  Copyright © 2019 Phil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CocoaHTTPServer/CocoaHTTPServer.h>

NS_ASSUME_NONNULL_BEGIN

@class IRHCDataRequest;

@interface IRHCHTTPRequest : HTTPMessage

@property (nonatomic, copy) NSString * originalURLString;

@property (nonatomic, assign) BOOL isHeaderComplete;
@property (nonatomic, strong) NSDictionary * allHeaderFields;

@property (nonatomic, copy) NSURL * URL;
@property (nonatomic, copy) NSString * method;
@property (nonatomic, assign) NSInteger statusCode;

@property (nonatomic, copy) NSString * version;


- (IRHCDataRequest *)dataRequest;

@end

NS_ASSUME_NONNULL_END
