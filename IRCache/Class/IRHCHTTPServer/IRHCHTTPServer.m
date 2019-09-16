//
//  IRHCHTTPServer.m
//  IRCache
//
//  Created by Phil on 2019/9/16.
//  Copyright © 2019 Phil. All rights reserved.
//

#import "IRHCHTTPServer.h"
#import "IRHCHTTPConnection.h"
#import <CocoaHTTPServer/CocoaHTTPServer.h>

@interface IRHCHTTPServer ()

@property (nonatomic, strong) HTTPServer * coreHTTPServer;

@end

@implementation IRHCHTTPServer


#pragma mark - Init

+ (instancetype)httpServer
{
    static IRHCHTTPServer * obj = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        obj = [[self alloc] init];
    });
    return obj;
}

- (instancetype)init
{
    if (self = [super init]) {
        
    }
    return self;
}


#pragma mark - Control

- (void)start:(NSError * __autoreleasing *)error
{
    self.coreHTTPServer = [[HTTPServer alloc] init];
    
    [self.coreHTTPServer setConnectionClass:[IRHCHTTPConnection class]];
    [self.coreHTTPServer setType:@"_http._tcp."];
    
    NSError * tempError = nil;
    [self.coreHTTPServer start:&tempError];
    if (tempError)
    {
        * error = tempError;
        NSLog(@"%@, start core HTTPServer error : %@", [self class], tempError);
    }
    else
    {
        NSLog(@"%@, start core HTTPServer success", [self class]);
    }
}

- (void)stop
{
    if (self.running) {
        [self.coreHTTPServer stop];
    }
}


#pragma mark - Setter/Getter

- (BOOL)running
{
    return self.coreHTTPServer.isRunning;
}

- (NSInteger)listeningPort
{
    if (self.running) {
        return self.coreHTTPServer.listeningPort;
    }
    return 0;
}

@end

