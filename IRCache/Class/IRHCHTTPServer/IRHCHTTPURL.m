//
//  IRHCHTTPURL.m
//  IRCache
//
//  Created by Phil on 2019/9/16.
//  Copyright © 2019 Phil. All rights reserved.
//

#import "IRHCHTTPURL.h"
#import "IRHCHTTPServer.h"
#import "IRHCURLTools.h"

static NSString * const IRHCHTTPURL_KEY_originalURL = @"originalURL";

@implementation IRHCHTTPURL

+ (IRHCHTTPURL *)URLWithURIString:(NSString *)URIString
{
    return [[self alloc] initWithURIString:URIString];
}

+ (IRHCHTTPURL *)URLWithOriginalURLString:(NSString *)originalURLString
{
    return [[self alloc] initWithOriginalURLString:originalURLString];
}

- (instancetype)initWithURIString:(NSString *)URIString
{
    if (self = [super init])
    {
        NSRange range = [URIString rangeOfString:@"/request?"];
        if (range.location != NSNotFound)
        {
            URIString = [URIString substringFromIndex:range.location + range.length];
            
            NSCharacterSet * delimiterSet = [NSCharacterSet characterSetWithCharactersInString:@"&"];
            NSScanner * scanner = [[NSScanner alloc] initWithString:URIString];
            while (![scanner isAtEnd])
            {
                NSString * pairString = nil;
                [scanner scanUpToCharactersFromSet:delimiterSet intoString:&pairString];
                [scanner scanCharactersFromSet:delimiterSet intoString:NULL];
                NSArray <NSString *> * pair = [pairString componentsSeparatedByString:@"="];
                if (pair.count == 2)
                {
                    NSString * key = pair.firstObject;
                    NSString * value = pair.lastObject;
                    
                    if ([key isEqualToString:IRHCHTTPURL_KEY_originalURL])
                    {
                        _originalURLString = [[IRHCURLTools URLDecode:value] copy];
                    }
                }
            }
        }
    }
    return self;
}

- (instancetype)initWithOriginalURLString:(NSString *)originalURLString
{
    if (self = [super init])
    {
        _originalURLString = [originalURLString copy];
    }
    return self;
}

- (NSString *)proxyURLString
{
    NSDictionary <NSString *, id> * params = @{IRHCHTTPURL_KEY_originalURL : [IRHCURLTools URLEncode:self.originalURLString]};
    
    NSMutableString * mutableString = [NSMutableString stringWithFormat:@"http://localhost:%ld/request?", self.listeningPort];
    [params enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [mutableString appendString:[NSString stringWithFormat:@"%@=%@&", key, obj]];
    }];
    return [mutableString substringToIndex:mutableString.length - 1];
}

- (NSInteger)listeningPort
{
    return [IRHCHTTPServer httpServer].listeningPort;
}

@end

