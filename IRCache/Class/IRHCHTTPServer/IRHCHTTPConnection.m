//
//  IRHCHTTPConnection.m
//  IRCache
//
//  Created by Phil on 2019/9/16.
//  Copyright © 2019 Phil. All rights reserved.
//

#import "IRHCHTTPConnection.h"
#import "IRHCHTTPRequest.h"
#import "IRHCHTTPResponse.h"
#import "IRHCHTTPURL.h"
#import "IRHCDataRequest.h"

@interface IRHCHTTPConnection ()

@property (nonatomic, strong) IRHCHTTPRequest * currentRequest;
@property (nonatomic, strong) IRHCHTTPResponse * currentResponse;

@end

@implementation IRHCHTTPConnection

- (NSObject<HTTPResponse> *)httpResponseForMethod:(NSString *)method URI:(NSString *)path
{
    IRHCHTTPURL * url = [IRHCHTTPURL URLWithURIString:path];
    
    self.currentRequest = [[IRHCHTTPRequest alloc] init];
    self.currentRequest.originalURLString = url.originalURLString;
    self.currentRequest.isHeaderComplete = request.isHeaderComplete;
    self.currentRequest.allHeaderFields = request.allHeaderFields;
    self.currentRequest.URL = request.url;
    self.currentRequest.method = request.method;
    self.currentRequest.statusCode = request.statusCode;
    self.currentRequest.version = request.version;
    
    IRHCDataRequest * dataRequest = [self.currentRequest dataRequest];
    self.currentResponse = [IRHCHTTPResponse responseWithConnection:self dataRequest:dataRequest];
    
    return self.currentResponse;
}

@end

