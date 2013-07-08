//
//  IAHTTPCommunication.h
//  ChuckNorrisRater
//
//  Created by Marius Butuc on 13-07-07.
//  Copyright (c) 2013 Marius Butuc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IAHTTPCommunication : NSObject

- (void)retrieveURL:(NSURL *)url successBlock:(void (^)(NSData *))successBlock;

@end
