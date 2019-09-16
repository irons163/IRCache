//
//  IRHCManager.m
//  IRCache
//
//  Created by Phil on 2019/9/16.
//  Copyright © 2019 Phil. All rights reserved.
//

#import "IRHCManager.h"
#import "IRHCHTTPServer.h"
#import "IRHCHTTPURL.h"

@implementation IRHCManager

+ (void)start:(NSError * __autoreleasing *)error
{
    [[IRHCHTTPServer httpServer] start:error];
}

+ (void)stop
{
    [[IRHCHTTPServer httpServer] stop];
}

+ (NSString *)URLStringWithOriginalURLString:(NSString *)urlString
{
    if ([IRHCHTTPServer httpServer].running)
    {
        IRHCHTTPURL * url = [IRHCHTTPURL URLWithOriginalURLString:urlString];
        return [url proxyURLString];
    }
    return urlString;
}

@end
