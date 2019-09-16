//
//  IRHCURLTools.m
//  IRCache
//
//  Created by Phil on 2019/9/16.
//  Copyright © 2019 Phil. All rights reserved.
//

#import "IRHCURLTools.h"

@implementation IRHCURLTools

+ (NSString *)URLEncode:(NSString *)URLString
{
    URLString = [URLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSUInteger length = [URLString length];
    const char * c = [URLString UTF8String];
    
    NSString * resultString = @"";
    for(int i = 0; i < length; i++) {
        switch (*c) {
            case '/':
                resultString = [resultString stringByAppendingString:@"%2F"];
                break;
            case '\'':
                resultString = [resultString stringByAppendingString:@"%27"];
                break;
            case ';':
                resultString = [resultString stringByAppendingString:@"%3B"];
                break;
            case '?':
                resultString = [resultString stringByAppendingString:@"%3F"];
                break;
            case ':':
                resultString = [resultString stringByAppendingString:@"%3A"];
                break;
            case '@':
                resultString = [resultString stringByAppendingString:@"%40"];
                break;
            case '&':
                resultString = [resultString stringByAppendingString:@"%26"];
                break;
            case '=':
                resultString = [resultString stringByAppendingString:@"%3D"];
                break;
            case '+':
                resultString = [resultString stringByAppendingString:@"%2B"];
                break;
            case '$':
                resultString = [resultString stringByAppendingString:@"%24"];
                break;
            case ',':
                resultString = [resultString stringByAppendingString:@"%2C"];
                break;
            case '[':
                resultString = [resultString stringByAppendingString:@"%5B"];
                break;
            case ']':
                resultString = [resultString stringByAppendingString:@"%5D"];
                break;
            case '#':
                resultString = [resultString stringByAppendingString:@"%23"];
                break;
            case '!':
                resultString = [resultString stringByAppendingString:@"%21"];
                break;
            case '(':
                resultString = [resultString stringByAppendingString:@"%28"];
                break;
            case ')':
                resultString = [resultString stringByAppendingString:@"%29"];
                break;
            case '*':
                resultString = [resultString stringByAppendingString:@"%2A"];
                break;
            default:
                resultString = [resultString stringByAppendingFormat:@"%c", *c];
        }
        c++;
    }
    
    return resultString;
}

+ (NSString *)URLDecode:(NSString *)URLString
{
    return [URLString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

@end
