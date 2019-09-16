//
//  IRHCHTTPResponse.m
//  IRCache
//
//  Created by Phil on 2019/9/16.
//  Copyright © 2019 Phil. All rights reserved.
//

#import "IRHCHTTPResponse.h"
#import "IRHCHTTPConnection.h"
#import "IRHCDataRequest.h"

@interface IRHCHTTPResponse ()

@property (nonatomic, weak) IRHCHTTPConnection * connection;
@property (nonatomic, strong) IRHCDataRequest * dataRequest;

@end

@implementation IRHCHTTPResponse

+ (instancetype)responseWithConnection:(IRHCHTTPConnection *)connection dataRequest:(IRHCDataRequest *)dataRequest
{
    return [[self alloc] initWithConnection:connection dataRequest:dataRequest];
}

- (instancetype)initWithConnection:(IRHCHTTPConnection *)connection dataRequest:(IRHCDataRequest *)dataRequest
{
    if (self = [super init])
    {
        self.connection = connection;
        self.dataRequest = dataRequest;
    }
    return self;
}

- (UInt64)contentLength
{
    return 0;
}

- (UInt64)offset
{
    return 0;
}

- (void)setOffset:(UInt64)offset
{
    
}

- (NSData *)readDataOfLength:(NSUInteger)length
{
    return nil;
}

- (BOOL)isDone
{
    return YES;
}

- (BOOL)delayResponseHeaders
{
    return NO;
}

- (NSInteger)status
{
    return 200;
}

- (NSDictionary *)httpHeaders
{
    return nil;
}

- (BOOL)isChunked
{
    return NO;
}

- (void)connectionDidClose
{
    
}

@end

