//
//  IAHTTPCommunication.m
//  ChuckNorrisRater
//
//  Created by Marius Butuc on 13-07-07.
//  Copyright (c) 2013 Marius Butuc. All rights reserved.
//

#import "IAHTTPCommunication.h"

@interface IAHTTPCommunication () {
    NSMutableData *receivedData;
}

@property (nonatomic, copy) void (^successBlock) (NSData *);

@end

@implementation IAHTTPCommunication

- (void) retrieveURL:(NSURL *) url successBlock:(void (^)(NSData *))successBlock
{
    self.successBlock = successBlock;
    receivedData = [NSMutableData data];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    NSURLConnection *urlConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [urlConnection start];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [receivedData appendData:data];
}

- (void)connection:(NSURLConnection *) connection didReceiveResponse:(NSURLResponse *)response
{
    [receivedData setLength:0];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    self.successBlock(receivedData);
}




@end
